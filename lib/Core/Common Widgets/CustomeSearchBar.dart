import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeSearchbar extends StatelessWidget {
  final Color backgroundcolor;
  final Color forgroundcolor;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int maxlines;
  final TextEditingController? controller;
  const CustomeSearchbar({
    super.key,
    required this.backgroundcolor,
    required this.forgroundcolor,
    required this.label,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.maxlines = 1,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(
        filled:true,
        fillColor: Colorsmanager.White.withOpacity(0.19),
        labelText: label,
        labelStyle: GoogleFonts.inter(color: forgroundcolor,fontWeight: FontWeight.bold),
        suffixIcon: suffixIcon!=null ? Icon(suffixIcon,color: forgroundcolor,) : null,
        prefixIcon: prefixIcon!=null ? Icon(prefixIcon,color: backgroundcolor,) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colorsmanager.transparentText),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colorsmanager.blackScreen, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: Colorsmanager.whiteCoffee, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
