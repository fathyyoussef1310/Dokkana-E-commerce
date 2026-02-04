import 'dart:ui';

import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
abstract class ThemeManager {
  // --- Light Theme (تم تعديله قليلاً ليكون أكثر مرونة) ---
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colorsmanager.whiteCoffee,
    primaryColorLight: Colorsmanager.whiteCoffee,
    primaryColorDark: Colorsmanager.blackScreen,
    primaryColor: Colorsmanager.whiteCoffee,
    textTheme: _getTextTheme(isDark: false),
  );
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colorsmanager.darkiestgrey,
    primaryColor: Colorsmanager.blackScreen,
    primaryColorLight: Colorsmanager.White,
    primaryColorDark: Colorsmanager.darkGray,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colorsmanager.whiteCoffee,
      selectedItemColor:Colorsmanager.darkpinkScreen,
      unselectedItemColor: Colorsmanager.whiteCoffee,
    ),

    textTheme: _getTextTheme(isDark: true),
  );
  static TextTheme _getTextTheme({required bool isDark}) {
    Color primaryTextColor = isDark ? Colors.white : Colorsmanager.blackScreen;
    Color secondaryTextColor = isDark ? Colors.white70 : Colors.black87;

    return TextTheme(
      // للعناوين الرئيسية (مثل اسم المنتج في Frame 17)
      displayLarge: GoogleFonts.aboreto(
        color: primaryTextColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      // للنصوص البارزة (مثل السعر)
      headlineLarge: GoogleFonts.aboreto(
        color: isDark ?  Colorsmanager.coffeeCheckout : Colorsmanager.blackScreen,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      // للنصوص العادية (مثل الوصف)
      bodyMedium: GoogleFonts.inter(
        color: secondaryTextColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      // للبراند أو العناوين الفرعية المميزة
      bodyLarge: GoogleFonts.aboreto(
        color: primaryTextColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      // لنصوص الأزرار (مثل Add to Bag)
      labelLarge: GoogleFonts.inter(
        color: isDark ? Colorsmanager.blackScreen : Colorsmanager.White,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}