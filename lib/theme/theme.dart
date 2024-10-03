import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF3F51B5),
  onPrimary: Colors.white,
  secondary: Color(0xFFE91E63),
  onSecondary: Colors.white,
  error: Color(0xFFD32F2F),
  onError: Colors.white,
  background: Color(0xFFECFDF6),
  onBackground: Color(0xFF1A118),
  shadow: Colors.black26,
  outlineVariant: Color(0xFFE0E0E0),
  surface: Colors.white,
  onSurface: Colors.black,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF3F51B5),
  onPrimary: Colors.white,
  secondary: Color(0xFFE91E63),
  onSecondary: Colors.white,
  error: Color(0xFFD32F2F),
  onError: Colors.white,
  background: Color(0xFF121212),
  onBackground: Color(0xFFE0E0E0),
  shadow: Colors.white24,
  outlineVariant: Color(0xFF303030),
  surface: Color(0xFF121212),
  onSurface: Color(0xFFE0E0E0),
);

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(lightColorScheme.primary),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      elevation: MaterialStateProperty.all<double>(5.0),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
);
