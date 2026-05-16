import 'package:flutter/material.dart';

class LuxuryColors {
  // Obsidian blacks & dark bases
  static const Color obsidianBlack = Color(0xFF0A0E27);
  static const Color darkCharcoal = Color(0xFF1A1F35);
  static const Color darkGrey = Color(0xFF2D3548);
  static const Color mediumDark = Color(0xFF3F4A5C);

  // 24K Gold accents
  static const Color luxuryGold = Color(0xFFD4AF37);
  static const Color brightGold = Color(0xFFE8C547);
  static const Color mutedGold = Color(0xFFC19A3F);
  static const Color goldAccent = Color(0xFFF0E68C);

  // Neon highlights
  static const Color neonCyan = Color(0xFF00F0FF);
  static const Color neonMagenta = Color(0xFFFF00FF);
  static const Color neonPurple = Color(0xFFBB00FF);
  static const Color neonBlue = Color(0xFF0080FF);

  // Ocean/Water palette
  static const Color oceanDeep = Color(0xFF0A1628);
  static const Color oceanMid = Color(0xFF1E3A5F);
  static const Color oceanLight = Color(0xFF2E5A8C);
  static const Color aquaticGlow = Color(0xFF00D9FF);

  // Semantic colors
  static const Color success = Color(0xFF00D084);
  static const Color error = Color(0xFFFF4444);
  static const Color warning = Color(0xFFFFB800);
  static const Color info = Color(0xFF00B4FF);

  // Neutral
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFE8E8E8);
  static const Color transparent = Color(0x00000000);
}

class LuxuryTheme {
  static ThemeData buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: LuxuryColors.obsidianBlack,
      primaryColor: LuxuryColors.luxuryGold,
      colorScheme: ColorScheme.dark(
        primary: LuxuryColors.luxuryGold,
        secondary: LuxuryColors.neonCyan,
        tertiary: LuxuryColors.neonPurple,
        surface: LuxuryColors.darkCharcoal,
        error: LuxuryColors.error,
        outline: LuxuryColors.darkGrey,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: LuxuryColors.darkCharcoal,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: LuxuryColors.luxuryGold,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: LuxuryColors.luxuryGold,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
        displayMedium: TextStyle(
          color: LuxuryColors.white,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
        headlineLarge: TextStyle(
          color: LuxuryColors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: LuxuryColors.luxuryGold,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: LuxuryColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: LuxuryColors.lightGrey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: LuxuryColors.luxuryGold,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: LuxuryColors.darkCharcoal,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: LuxuryColors.darkGrey,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: LuxuryColors.darkGrey,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: LuxuryColors.luxuryGold,
            width: 2.0,
          ),
        ),
        hintStyle: const TextStyle(
          color: LuxuryColors.mediumDark,
          fontSize: 14,
        ),
        labelStyle: const TextStyle(
          color: LuxuryColors.luxuryGold,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LuxuryColors.luxuryGold,
          foregroundColor: LuxuryColors.obsidianBlack,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 8,
          shadowColor: LuxuryColors.luxuryGold,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: LuxuryColors.luxuryGold,
          side: const BorderSide(
            color: LuxuryColors.luxuryGold,
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: LuxuryColors.luxuryGold,
        ),
      ),
      cardTheme: CardTheme(
        color: LuxuryColors.darkCharcoal,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: LuxuryColors.darkGrey,
            width: 1,
          ),
        ),
      ),
      dividerColor: LuxuryColors.darkGrey,
      iconTheme: const IconThemeData(
        color: LuxuryColors.luxuryGold,
      ),
    );
  }
}
