import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextButtom.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextForemfield.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Imagesmanager.authImage),
              fit: BoxFit.cover,
            ),
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dokkan",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Colorsmanager.White,
                fontSize: 40.sp,
              ),),
              SizedBox(height: 10.h,),
              Text("Sign up",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colorsmanager.White
              ),),
              SizedBox(height: 33.h,),
              Custometextforemfield(prefixIcon: CupertinoIcons.person_alt,hint: "Name", label: "Name", color: Colorsmanager.blackScreen),
              SizedBox(height: 33.h,),
              Custometextforemfield(prefixIcon: CupertinoIcons.mail_solid,hint: "Email", label: "Email", color: Colorsmanager.blackScreen),
              SizedBox(height: 33.h,),
              Custometextforemfield(prefixIcon:CupertinoIcons.lock_fill,hint: "Password", label: "Password", color: Colorsmanager.blackScreen),
              SizedBox(height: 33.h,),
              Custometextforemfield(prefixIcon: CupertinoIcons.lock_fill,suffixIcon: CupertinoIcons.eye_slash_fill,hint: "Confirm Password", label: "ConfirmPass", color: Colorsmanager.blackScreen),
              SizedBox(height: 29.h,),
              CustomElevatedButton(onPressed: (){
                Navigator.pushNamed(context, RoutesManager.loginScreen);
              }, title: "Sign In", backgroundColor: Colorsmanager.White, foregroundColor: Colorsmanager.blackScreen)
            ],
          )
      )
    );
  }
}
