import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Custometextforemfield extends StatelessWidget {
  Custometextforemfield({super.key,required this.hint,required this.label,this.prefixIcon,this.suffixIcon,required this.color,this.onChanged, this.controller,this.maxLines=1,this.validator});
  String hint;
  String label;
  Color color;
  IconData? suffixIcon;
  IconData? prefixIcon;
  int maxLines;
  TextEditingController? controller;
  String? Function(String?)? validator;
  dynamic onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colorsmanager.whiteScreen,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: GoogleFonts.poppins(color: color,fontSize: 16.sp,fontWeight: FontWeight.w700),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colorsmanager.blackScreen,fontSize: 16.sp,fontWeight: FontWeight.w700),
        suffixIcon: suffixIcon!=null ? Icon(suffixIcon,color: color,) : null,
        prefixIcon: prefixIcon!=null ? Icon(prefixIcon,color: color,) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colorsmanager.whiteScaffoldScreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colorsmanager.whiteScreen, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colorsmanager.blackScreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colorsmanager.whiteScreen.withOpacity(0.15),
      ),
    );
  }
}
