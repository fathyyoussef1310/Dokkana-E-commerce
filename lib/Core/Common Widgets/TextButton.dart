import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomeTextButton extends StatelessWidget {
  const CustomeTextButton({super.key , required this.title , required this.onPressed,this.color,required this.size});
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title,style: TextStyle(color: color,fontSize: size.sp),),
    );
  }
}