import 'package:flutter/material.dart';

class AppTheme {
  static const Color _lightPrimaryColor = Colors.blue;
  static const Color _darkPrimaryColor = Colors.blueAccent;
  static const Color _lightBackgroundColor = Colors.white;
  static const Color _darkBackgroundColor = Color(0xFF121212);

  static ThemeData lightTheme = ThemeData(
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightPrimaryColor,
      foregroundColor: _lightBackgroundColor,
    ),
    colorScheme: ColorScheme.light(primary: _lightPrimaryColor),
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[100],
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(255, 230, 230, 230),
      border: OutlineInputBorder(),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: _darkPrimaryColor,
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkPrimaryColor,
      foregroundColor: _lightBackgroundColor,
    ),
    colorScheme: ColorScheme.dark(primary: _darkPrimaryColor),
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[800],
    ),
        inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(255, 59, 59, 59),
      border: OutlineInputBorder(),
    ),
  );
}