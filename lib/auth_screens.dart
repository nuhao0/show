import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets.dart';

class UserProvider extends InheritedWidget {
  final Map<String, dynamic> userData;

  const UserProvider({
    Key? key,
    required this.userData,
    required Widget child,
  }) : super(key: key, child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  String get role => userData['role'] ?? 'owner';
  String get restaurantId => userData['restaurantId'] ?? 'demo_123';
  bool get isOwner => role == 'owner';
  String get name => userData['name'] ?? 'Atlantic';

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return userData != oldWidget.userData;
  }
}

class AuthWrapper extends StatefulWidget {
  final Widget child;
  const AuthWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    if (!_isAuthenticated) {
      return LoginScreen(onLogin: () {
        setState(() {
          _isAuthenticated = true;
        });
      });
    }

    return UserProvider(
      userData: const {
        'name': 'Atlantic',
        'role': 'owner',
        'restaurantId': 'demo_123',
        'email': 'atlantic@gmail.com'
      },
      child: widget.child,
    );
  }
}

class LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;
  const LoginScreen({Key? key, required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "AR",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      fontFamily: AppFonts.jakarta,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Atlantic Restaurant POS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: AppFonts.jakarta)),
                const Text("Login to continue (Demo)", style: TextStyle(fontSize: 16, color: AppColors.textMuted, fontFamily: AppFonts.cairo)),
                const SizedBox(height: 32),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  controller: TextEditingController(text: "atlantic@gmail.com"),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  obscureText: true,
                  controller: TextEditingController(text: "password123"),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.textDark,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Login (Skip Auth)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Employee management not available in demo mode."));
  }
}
