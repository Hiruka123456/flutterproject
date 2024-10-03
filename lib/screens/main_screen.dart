import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_example/constants.dart';
import 'package:shop_example/screens/cart_screen.dart';
import 'package:shop_example/screens/home_screen.dart';
import 'package:shop_example/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 2; // Set Home as the initial tab
  List<Widget> screens = const [
    Scaffold(), // Placeholder for any additional screen
    Scaffold(), // Placeholder for any additional screen
    HomeScreen(), // Home screen
    CartScreen(), // Cart screen
    ProfileScreen(), // Profile screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTab], // Display the current screen based on the tab
    );
  }
}
