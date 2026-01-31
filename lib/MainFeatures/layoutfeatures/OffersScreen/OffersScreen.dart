import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Offersscreen extends StatelessWidget {
  const Offersscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("Offers",style: GoogleFonts.aboreto(fontSize: 19.sp,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
