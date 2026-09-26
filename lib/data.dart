import 'package:showpos/models.dart';

const Map<Lang, Map<String, String>> TR = {
  Lang.ku: {
    "appName":"Atlantic Restaurant", "pos":"کاشیر", "history":"مێژووی فرۆشتن", "daily":"ڕاپۆرتی ڕۆژانە",
    "monthly":"ڕاپۆرتی مانگانە", "yearly":"ڕاپۆرتی ساڵانە", "menuMgmt":"بەڕێوەبردنی مینیۆ",
    "settings":"ڕێکخستنەکان", "logout":"چوونەدەرەوە", "all":"هەموو",
    "newOrder":"داواکاری نوێ", "clearOrder":"سڕینەوە", "checkout":"پرداخت", "print":"چاپکردن",
    "subtotal":"کۆی جیاواز", "discount":"داشکاندن", "total":"کۆی گشتی",
    "paid":"پرداخت کرا", "change":"پاشگەڕاندنەوە", "cash":"نەقد", "card":"کارت",
    "orderNum":"ژمارەی داواکاری", "cashier":"کاشیر", "totalRevenue":"کۆی داهات",
    "totalOrders":"کۆی داواکاری", "avgOrder":"ناوەندی داواکاری", "bestItems":"باشترین بابەتەکان",
    "bestCats":"باشترین جۆرەکان", "payBreakdown":"جۆری پرداخت", "salesTrend":"ڕوانگەی فرۆشتن",
    "thankYou":"سوپاس بۆ داواکاریەکەتان", "active":"چالاک", "inactive":"ناچالاک",
    "save":"پاشەکەوتکردن", "language":"زمان", "kurdish":"کوردی", "arabic":"عەرەبی",
    "confirmClear":"دڵنیای لە سڕینەوەی داواکاری؟", "yes":"بەڵێ", "no":"نەخێر",
    "reprint":"دووبارە چاپکردن", "status":"دۆخ", "completed":"تەواوبوو",
    "cancelled":"هەڵوەشاوە", "refunded":"گەڕاندرایەوە", "receipt":"وەصل", "close":"داخستن",
    "payMethod":"جۆری پرداخت", "addItem":"زیادکردنی بابەتێک", "editItem":"دەستکاریکردن",
    "kurdishName":"ناوی کوردی", "arabicName":"ناوی عەرەبی", "price":"نرخ",
    "category":"جۆر", "actions":"کردارەکان", "from":"لە", "to":"بۆ",
    "cashierName":"ناوی کاشیر", "qty":"ژمارە", "searchPlaceholder":"گەڕان بکە...",
    "revenue":"داهات", "orders":"داواکاری", "filterDate":"فلتەری بەروار",
    "emptyCart":"داواکاری بەتاڵە", "confirmPayment":"پشتڕاستکردنەوەی پرداخت",
    "enterPaid":"بڕی پرداخت بنووسە", "printerSettings":"ڕێکخستنی چاپکەر",
    "appSettings":"ڕێکخستنی سیستەم", "name":"ناو",
    "profileSettings": "ڕێکخستنی پرۆفایل",
  },
  Lang.ar: {
    "appName":"Atlantic Restaurant", "pos":"الكاشير", "history":"سجل المبيعات", "daily":"التقارير اليومية",
    "monthly":"التقارير الشهرية", "yearly":"التقارير السنوية", "menuMgmt":"إدارة القائمة",
    "settings":"الإعدادات", "logout":"تسجيل الخروج", "all":"الكل",
    "newOrder":"طلب جديد", "clearOrder":"مسح", "checkout":"الدفع", "print":"طباعة",
    "subtotal":"المجموع الفرعي", "discount":"الخصم", "total":"المجموع الكلي",
    "paid":"المدفوع", "change":"الباقي", "cash":"نقدي", "card":"بطاقة",
    "orderNum":"رقم الطلب", "cashier":"الكاشير", "totalRevenue":"إجمالي الإيرادات",
    "totalOrders":"إجمالي الطلبات", "avgOrder":"متوسط الطلب", "bestItems":"أفضل العناصر",
    "bestCats":"أفضل الفئات", "payBreakdown":"تفصيل الدفع", "salesTrend":"مؤشر المبيعات",
    "thankYou":"شكراً لطلبكم", "active":"نشط", "inactive":"غير نشط",
    "save":"حفظ", "language":"اللغة", "kurdish":"الكردية", "arabic":"العربية",
    "confirmClear":"هل أنت متأكد من مسح الطلب؟", "yes":"نعم", "no":"لا",
    "reprint":"إعادة الطباعة", "status":"الحالة", "completed":"مكتمل",
    "cancelled":"ملغى", "refunded":"مسترد", "receipt":"الفاتورة", "close":"إغلاق",
    "payMethod":"طريقة الدفع", "addItem":"إضافة عنصر", "editItem":"تعديل",
    "kurdishName":"الاسم الكردي", "arabicName":"الاسم العربي", "price":"السعر",
    "category":"الفئة", "actions":"الإجراءات", "from":"من", "to":"إلى",
    "cashierName":"اسم الكاشير", "qty":"الكمية", "searchPlaceholder":"ابحث...",
    "revenue":"الإيرادات", "orders":"الطلبات", "filterDate":"تصفية بالتاريخ",
    "emptyCart":"الطلب فارغ", "confirmPayment":"ت تأكيد الدفع",
    "enterPaid":"أدخل المبلغ المدفوع", "printerSettings":"إعدادات الطابعة",
    "appSettings":"إعدادات النظام", "name":"الاسم",
    "profileSettings": "إعدادات الملف الشخصي",
  }
};

const Map<String, Map<Lang, String>> CATS = {
  "starters": { Lang.ku:"ستارتەرەکان", Lang.ar:"مقبلات" },
  "steaks":   { Lang.ku:"ستیک", Lang.ar:"ستيك" },
  "seafood":  { Lang.ku:"خواردنی دەریایی", Lang.ar:"مأكولات بحرية" },
  "pasta":    { Lang.ku:"پاستا", Lang.ar:"باستا" },
  "desserts": { Lang.ku:"شیرینی", Lang.ar:"حلويات" },
  "drinks":   { Lang.ku:"خواردنەوە", Lang.ar:"مشروبات" },
};

final List<MenuItemModel> INITIAL_MENU = [
  MenuItemModel(id: "s1", categoryId: "starters", nameKu: "زەڵاتەی سیزەر", nameAr: "سلطة سيزر", nameEn: "Caesar Salad", priceIQD: 8000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_0.jpg", isAvailable: true),
  MenuItemModel(id: "s2", categoryId: "starters", nameKu: "شۆربای قارچک", nameAr: "حساء الفطر", nameEn: "Mushroom Soup", priceIQD: 6000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_1.jpg", isAvailable: true),
  MenuItemModel(id: "m1", categoryId: "steaks", nameKu: "ستیکی ریبای", nameAr: "ريب آي ستيك", nameEn: "Ribeye Steak", priceIQD: 35000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_2.jpg", isAvailable: true),
  MenuItemModel(id: "m2", categoryId: "steaks", nameKu: "تۆماهۆک ستیک", nameAr: "توماهوك ستيك", nameEn: "Tomahawk Steak", priceIQD: 55000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_3.jpg", isAvailable: true),
  MenuItemModel(id: "f1", categoryId: "seafood", nameKu: "سەلەمۆنی برژاو", nameAr: "سلمون مشوي", nameEn: "Grilled Salmon", priceIQD: 25000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_4.jpg", isAvailable: true),
  MenuItemModel(id: "f2", categoryId: "seafood", nameKu: "ڕۆبیانی سورەوکراو", nameAr: "روبيان مقلي", nameEn: "Fried Shrimp", priceIQD: 20000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_5.jpg", isAvailable: true),
  MenuItemModel(id: "p1", categoryId: "pasta", nameKu: "پاستا ترەفڵ", nameAr: "باستا ترافل", nameEn: "Truffle Pasta", priceIQD: 18000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_6.jpg", isAvailable: true),
  MenuItemModel(id: "p2", categoryId: "pasta", nameKu: "پاستا کاربۆنارا", nameAr: "باستا كاربونارا", nameEn: "Carbonara Pasta", priceIQD: 16000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_7.jpg", isAvailable: true),
  MenuItemModel(id: "d1", categoryId: "desserts", nameKu: "تیرامیسو", nameAr: "تيراميسو", nameEn: "Tiramisu", priceIQD: 9000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_8.jpg", isAvailable: true),
  MenuItemModel(id: "d2", categoryId: "desserts", nameKu: "چیزکەیک", nameAr: "تشيز كيك", nameEn: "Cheesecake", priceIQD: 8000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_9.jpg", isAvailable: true),
  MenuItemModel(id: "b1", categoryId: "drinks", nameKu: "مۆخیتۆ", nameAr: "موهيتو", nameEn: "Mojito", priceIQD: 5000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_10.jpg", isAvailable: true),
  MenuItemModel(id: "b2", categoryId: "drinks", nameKu: "شەربەتی فرێش", nameAr: "عصير طازج", nameEn: "Fresh Juice", priceIQD: 4000.0, imageSearchQuery: "", imageUrl: "assets/mock/img_11.jpg", isAvailable: true),
];

List<Order> generateSampleOrders() {
  final cashiers = ["ئارام", "سارا", "ئەحمەد"];
  final pool = INITIAL_MENU;
  List<Order> orders = [];
  int orderNum = 100;
  
  for (int i = 0; i < 25; i++) {
    orderNum++;
    final itemsCount = 1 + (i % 3);
    List<OrderItem> items = [];
    double subtotal = 0;
    
    for (int j = 0; j < itemsCount; j++) {
      final item = pool[(i + j) % pool.length];
      final qty = 1 + (j % 2);
      items.add(OrderItem(id: item.id, nameKu: item.nameKu, nameAr: item.nameAr, price: item.priceIQD, qty: qty));
      subtotal += item.priceIQD * qty;
    }
    
    orders.add(Order(
      id: "ord_\$orderNum",
      numStr: orderNum.toString().padLeft(4, '0'),
      date: DateTime.now().subtract(Duration(hours: i * 2, minutes: i * 15)),
      cashier: cashiers[i % cashiers.length],
      items: items,
      subtotal: subtotal,
      discount: 0,
      total: subtotal,
      payMethod: i % 4 == 0 ? PayMethod.card : PayMethod.cash,
      paid: subtotal,
      change: 0,
      status: OrderStatus.completed,
    ));
  }
  return orders;
}
