import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextButtom.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/core/Common%20Widgets/RoutesManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
class Otppage extends StatefulWidget {
  const Otppage({super.key});
  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: GoogleFonts.aboreto(fontSize: 20.sp, color: Colorsmanager.darkpinkScreen, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: Colorsmanager.gold),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colorsmanager.gold),
      borderRadius: BorderRadius.circular(20.r),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colorsmanager.darkGray,
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Imagesmanager.authImage),
          fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign In",style: GoogleFonts.aboreto(color: Colorsmanager.White,fontWeight: FontWeight.bold,fontSize: 30.sp),),
            SizedBox(height: 10.h,),
        Pinput(
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          validator: (s) {
            return s == '1111' ? null : 'InCorrectedPin';
            },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Correct Otp",style: GoogleFonts.aboreto(color: Colorsmanager.White),),backgroundColor: Colorsmanager.green,)),
        ),
            SizedBox(height: 10.h,),
            CustomElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, RoutesManager.loginScreen);
            }, title: "Verify", backgroundColor: Colorsmanager.White, foregroundColor: Colorsmanager.blackScreen,PrefixIcon: CupertinoIcons.lock_open_fill,)
          ],
        ),
      ),
    );
  }
}
