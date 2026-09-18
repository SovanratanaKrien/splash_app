import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/screens/checkout/shipping_screen.dart';
import 'package:splash_app/screens/home_screen.dart';
import 'package:splash_app/screens/user/setting_screen.dart';
import 'package:splash_app/widgets/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // The screens for each tab
  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Wishlist Screen')),
    const Center(child: Text('Search Screen')),
    const SettingScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const ShippingScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
          if (result != null && result is int) {
            _onTabTapped(result);
          }
        },
        backgroundColor: AppColors.redPink,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart_outlined,
            color: AppColors.white, size: 28),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
