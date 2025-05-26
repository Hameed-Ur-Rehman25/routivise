import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromRGBO(25, 153, 249, 1);
  static const Color secondary = Color(0xFF00C6AE);
  static const Color background = Color(0xFFF5F6FA);
  static const Color accent = Color(0xFFFFC542);
  static const Color error = Color(0xFFFF5A5F);
  static const Color textPrimary = Color(0xFF222B45);
  static const Color textSecondary = Color(0xFF8F9BB3);
  static const Color gradientStart = Color.fromRGBO(25, 153, 249, 1);
  static const Color gradientEnd = Color.fromRGBO(17, 61, 94, 1);
}

ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secondary,
    error: AppColors.error,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary),
    bodyMedium: TextStyle(color: AppColors.textSecondary),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),
);
