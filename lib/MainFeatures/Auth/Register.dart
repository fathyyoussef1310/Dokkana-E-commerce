import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextButtom.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextForemfield.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/TextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
          child: Image.asset(
            Imagesmanager.authImage,
            fit: BoxFit.cover,
          ),
        ),
          SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dokkan",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colorsmanager.whiteScreen,
                    fontSize: 40.sp,
                  ),),
                  SizedBox(height: 10.h,),
                  Text("Sign up",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colorsmanager.whiteScreen
                  ),),
                  SizedBox(height: 30.h,),
                  Custometextforemfield(prefixIcon: CupertinoIcons.person_alt,hint: "Name", label: "Name", color: Colorsmanager.blackScreen),
                  SizedBox(height: 30.h,),
                  Custometextforemfield(prefixIcon: CupertinoIcons.mail_solid,hint: "Email", label: "Email", color: Colorsmanager.blackScreen),
                  SizedBox(height: 30.h,),
                  Custometextforemfield(prefixIcon:CupertinoIcons.lock_fill,hint: "Password", label: "Password", color: Colorsmanager.blackScreen),
                  SizedBox(height: 30.h,),
                  Custometextforemfield(prefixIcon: CupertinoIcons.lock_fill,suffixIcon: CupertinoIcons.eye_slash_fill,hint: "Confirm Password", label: "Confirm Password", color: Colorsmanager.blackScreen),
                  SizedBox(height: 20.h,),
                  CustomElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, RoutesManager.loginScreen);
                  }, title: "Sign Up", backgroundColor: Colorsmanager.whiteScreen, foregroundColor: Colorsmanager.blackScreen)
                ],
              ),
            ),
          )
    ]),
    );
  }
}
