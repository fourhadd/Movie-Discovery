// core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryRed = Color(0xFFE50914);
  static const Color backgroundDark = Color(0xFF0D0D12);
  static const Color cardDark = Color(0xFF1A1A24);
  static const Color textWhite = Colors.white;
  static const Color textGrey = Colors.grey;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundDark,
      primaryColor: primaryRed,
      colorScheme: const ColorScheme.dark(
        primary: primaryRed,
        surface: cardDark,
        background: backgroundDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: textWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
