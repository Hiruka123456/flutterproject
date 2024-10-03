import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_example/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _lightTheme(), // Use the light theme
      darkTheme: _darkTheme(), // Use the dark theme
      themeMode: ThemeMode.system, // Switch between light and dark based on system settings
      home: const SignInScreen(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      useMaterial3: true,
      textTheme: GoogleFonts.mulishTextTheme(),
      brightness: Brightness.light, // Explicitly set brightness
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
        brightness: Brightness.dark, // Set brightness to dark
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.mulishTextTheme(),
      brightness: Brightness.dark, // Explicitly set brightness
    );
  }
}
