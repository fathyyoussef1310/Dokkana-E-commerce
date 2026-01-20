import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/TextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Common Widgets/ColorsManager.dart';
import '../../Core/Common Widgets/CustomeTextButtom.dart';
import '../../Core/Common Widgets/CustomeTextForemfield.dart';
import '../../Core/Common Widgets/ImagesManager.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                Imagesmanager.authImage,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dokkan",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colorsmanager.White,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 40.h,),
                Text("Sign In",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colorsmanager.White
                ),),
                SizedBox(height:30.h),
                Custometextforemfield(hint: "Email", label: "Email", color: Colorsmanager.blackScreen),
                SizedBox(height:30.h),
                Custometextforemfield(hint: "Password", label: "Password", color: Colorsmanager.blackScreen),
                SizedBox(height: 4.sp,),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomeTextButton(title: "Forget Password", onPressed: (){
                    Navigator.pushNamed(context, RoutesManager.registerScreen);
                  }, size: 19.sp,color: Colorsmanager.White,),
                ),
                SizedBox(height: 20.h,),
                CustomElevatedButton(onPressed: (){}, title: 'SignIn', backgroundColor: Colorsmanager.White, foregroundColor: Colorsmanager.blackScreen),
              ],
            )
          ]),
    );
  }
}
