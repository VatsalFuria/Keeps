import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFFF7F4ED);
  static const bg2 = Color(0xFFEEE7DA);
  static const accent = Color(0xFF657153);
  static const accent2 = Color(0xFF8B6B4C);
  static const border = Color(0xFFD8CFBE);
  static const text = Color(0xFF2F2F2F);
  static const text2 = Color(0xFF6D6A65);
  static const danger = Color(0xFFA05A4C);
  static const warn = Color(0xFFB98B3E);
}

ThemeData buildKeepsTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.accent,
      secondary: AppColors.accent2,
      surface: AppColors.bg2,
      error: AppColors.danger,
    ),
    textTheme: GoogleFonts.loraTextTheme(base.textTheme).copyWith(
      bodyMedium: GoogleFonts.inter(color: AppColors.text, fontSize: 15),
      bodySmall: GoogleFonts.inter(color: AppColors.text2, fontSize: 13),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bg2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.bg2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.border),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
    ),
  );
}