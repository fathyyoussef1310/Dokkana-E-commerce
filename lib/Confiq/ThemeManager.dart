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
    scaffoldBackgroundColor: Colorsmanager.White,
    appBarTheme: AppBarThemeData(
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: Colorsmanager.blackScreen,
      ),
    ),
    primaryColor: const Color.fromARGB(255, 227, 226, 226),
    secondaryHeaderColor: Colorsmanager.coffeeCheckout,
    primaryColorDark: Colorsmanager.blackScreen,
    primaryColorLight: Colorsmanager.blackScreen
    //textTheme: _getTextTheme(isDark: false),
  );
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colorsmanager.blackScreen,
    appBarTheme: AppBarThemeData(
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: Colorsmanager.White,
      ),
    ),
    primaryColor: const Color.fromARGB(255, 93, 93, 93),
    secondaryHeaderColor: const Color.fromARGB(255, 93, 93, 93),
    primaryColorDark: Color.fromARGB(255, 40, 41, 47),
    primaryColorLight: Colorsmanager.White
    //textTheme: _getTextTheme(isDark: true),
  );

  // static TextTheme _getTextTheme({required bool isDark}) {
  //   Color primaryTextColor = isDark ? Colors.white : Colorsmanager.blackScreen;
  //   Color secondaryTextColor = isDark ? Colors.white70 : Colors.black87;

  //   return TextTheme(
  //     // للعناوين الرئيسية (مثل اسم المنتج في Frame 17)
  //     displayLarge: GoogleFonts.aboreto(
  //       color: primaryTextColor,
  //       fontSize: 20.sp,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     // للنصوص البارزة (مثل السعر)
  //     headlineLarge: GoogleFonts.aboreto(
  //       color: isDark ?  Colorsmanager.coffeeCheckout : Colorsmanager.blackScreen,
  //       fontSize: 16.sp,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     // للنصوص العادية (مثل الوصف)
  //     bodyMedium: GoogleFonts.inter(
  //       color: secondaryTextColor,
  //       fontSize: 15.sp,
  //       fontWeight: FontWeight.w400,
  //     ),
  //     // للبراند أو العناوين الفرعية المميزة
  //     bodyLarge: GoogleFonts.aboreto(
  //       color: primaryTextColor,
  //       fontSize: 18.sp,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     // لنصوص الأزرار (مثل Add to Bag)
  //     labelLarge: GoogleFonts.inter(
  //       color: isDark ? Colorsmanager.blackScreen : Colorsmanager.White,
  //       fontSize: 16,
  //       fontWeight: FontWeight.w600,
  //     ),
  //   );
  // }
}
