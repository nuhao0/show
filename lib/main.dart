import 'package:flutter/material.dart';
import 'dart:async';





import 'models.dart';
import 'data.dart';
import 'theme.dart';
import 'widgets.dart';

import 'pos_screen.dart';
import 'history_screen.dart';
import 'menu_screen.dart';
import 'settings_screen.dart';
import 'reports_screen.dart';
import 'modals.dart';
import 'auth_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const POSApp());
}

class POSApp extends StatelessWidget {
  const POSApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlantic Restaurant POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.jakarta,
        scaffoldBackgroundColor: AppColors.bgLight,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.navy),
      ),
      home: const AuthWrapper(child: MainLayout()),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  ScreenType _screen = ScreenType.pos;
  Lang _lang = Lang.ku;
  List<CartItem> _cart = [];
  List<Order> _orders = [];
  List<MenuItemModel> _menuItems = INITIAL_MENU;
  int _orderNum = 400;
  bool _showCheckout = false;
  bool _autoPrint = true;
  Order? _showReceipt;
  String _cashierName = "";
  
  StreamSubscription? _menuSub;
  StreamSubscription? _ordersSub;

  String? _currentRestaurantId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userProvider = UserProvider.of(context);
    if (userProvider != null) {
      if (_cashierName.isEmpty) {
        _cashierName = userProvider.name;
      }
      if (userProvider.restaurantId != _currentRestaurantId) {
        _currentRestaurantId = userProvider.restaurantId;
        
      }
    }
  }

  @override
  void dispose() {
    _menuSub?.cancel();
    _ordersSub?.cancel();
    super.dispose();
  }

  void _toggleLang() {
    setState(() {
      _lang = _lang == Lang.ku ? Lang.ar : Lang.ku;
    });
  }

  void _navigate(ScreenType screen) {
    setState(() {
      _screen = screen;
    });
  }

  Widget _buildScreen() {
    switch (_screen) {
      case ScreenType.pos:
        return POSScreen(
          cart: _cart,
          menuItems: _menuItems,
          orderNum: _orderNum,
          cashierName: _cashierName,
          lang: _lang,
          onAdd: (item) {
            setState(() {
              final idx = _cart.indexWhere((c) => c.item.id == item.id);
              if (idx >= 0) {
                _cart[idx].qty++;
              } else {
                _cart.add(CartItem(item: item, qty: 1));
              }
            });
          },
          onQty: (id, d) {
            setState(() {
              final idx = _cart.indexWhere((c) => c.item.id == id);
              if (idx >= 0) {
                _cart[idx].qty += d;
                if (_cart[idx].qty <= 0) _cart.removeAt(idx);
              }
            });
          },
          onRemove: (id) {
            setState(() {
              _cart.removeWhere((c) => c.item.id == id);
            });
          },
          onNewOrder: () => setState(() => _cart.clear()),
          onClear: () => setState(() => _cart.clear()),
          onCheckout: () => setState(() => _showCheckout = true),
        );
      case ScreenType.history:
        return HistoryScreen(
          orders: _orders,
          lang: _lang,
          onReprint: (o) => setState(() => _showReceipt = o),
        );
      case ScreenType.reports:
        return ReportsScreen(
          orders: _orders,
          lang: _lang,
        );
      case ScreenType.menu:
        return MenuScreen(
          menuItems: _menuItems,
          lang: _lang,
          onUpdate: (items) async {
            setState(() {
              _menuItems = items;
            });
          },
        );
      case ScreenType.settings:
        return SettingsScreen(
          lang: _lang,
          cashierName: _cashierName,
          autoPrint: _autoPrint,
          onLangChange: (l) => setState(() => _lang = l),
          onCashierChange: (name) {
            setState(() => _cashierName = name);
            final userProvider = UserProvider.of(context);
            if (userProvider != null) {
              
            }
          },
          onAutoPrintChange: (val) => setState(() => _autoPrint = val),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_showCheckout && _cart.isNotEmpty) {
        _showCheckout = false;
        showCheckoutModal(
          context: context,
          cart: _cart,
          orderNum: _orderNum,
          cashierName: _cashierName,
          lang: _lang,
          onConfirm: (payMethod, paid, discount, printReceipt) {
            final userProvider = UserProvider.of(context)!;
            final subtotal = _cart.fold<double>(0, (s, ci) => s + (ci.item.priceIQD * ci.qty));
            final total = (subtotal - discount) < 0 ? 0.0 : (subtotal - discount);
              final newOrder = Order(
                id: 'ord_$_orderNum',
                numStr: _orderNum.toString().padLeft(4, '0'),
                date: DateTime.now(),
                cashier: _cashierName,
                items: _cart.map((c) => OrderItem(id: c.item.id, nameKu: c.item.nameKu, nameAr: c.item.nameAr, price: c.item.priceIQD, qty: c.qty)).toList(),
                subtotal: subtotal,
                discount: discount,
                total: total,
                payMethod: payMethod,
                paid: paid,
                change: paid - total,
                status: OrderStatus.completed,
              );
              
              // Save locally
              _orders.insert(0, newOrder);

              setState(() {
                // We no longer need to insert it manually into _orders because StreamBuilder will fetch it.
                // But we clear the cart and handle the receipt.
                _cart.clear();
                if (!userProvider.isOwner) {
                  _orderNum = (DateTime.now().millisecondsSinceEpoch % 10000).toInt();
                }
                if (printReceipt) {
                  _showReceipt = newOrder;
                }
              });
              Navigator.pop(context); // close checkout modal
          },
        );
      }
      
      if (_showReceipt != null) {
        final r = _showReceipt!;
        _showReceipt = null;
        showReceiptModal(context: context, order: r, lang: _lang);
      }
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;
        
        return Scaffold(
          appBar: isMobile
              ? AppBar(
                  backgroundColor: AppColors.white,
                  iconTheme: const IconThemeData(color: AppColors.navy),
                  elevation: 0,
                  title: TopBar(
                    lang: _lang,
                    cashierName: _cashierName,
                    onLangToggle: _toggleLang,
                    isMobile: true,
                  ),
                )
              : null,
          drawer: isMobile
              ? Drawer(
                  child: Sidebar(
                    screen: _screen,
                    lang: _lang,
                    onNavigate: (s) {
                      _navigate(s);
                      Navigator.pop(context); // close drawer
                    },
                    onLogout: () {
                    
                  },
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Sidebar(
                  screen: _screen,
                  lang: _lang,
                  onNavigate: _navigate,
                  onLogout: () {
                    
                  },
                ),
              Expanded(
                child: Column(
                  children: [
                    if (!isMobile)
                      TopBar(
                        lang: _lang,
                        cashierName: _cashierName,
                        onLangToggle: _toggleLang,
                        isMobile: false,
                      ),
                    Expanded(
                      child: _buildScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
