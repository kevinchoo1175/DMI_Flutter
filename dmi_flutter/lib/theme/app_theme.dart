import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color(0xFFff2f55),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFff2f55),
        secondary: Color(0xFFff2f55),
        surface: Color(0xFF121214),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Color(0xFFc9bcc2)),
      ),
    );
  }
}