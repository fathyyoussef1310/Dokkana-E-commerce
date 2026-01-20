import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Core/Common Widgets/ColorsManager.dart';

abstract class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colorsmanager.whiteCoffee,

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: Colorsmanager.whiteCoffee,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.inter(
        color: Colors.black87,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.inter(
        color: Colors.black54,
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
      displayLarge: GoogleFonts.inter(
        color: Colorsmanager.whiteCoffee,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: GoogleFonts.inter(
        color: Colorsmanager.whiteCoffee,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData dark = ThemeData.dark();
}
