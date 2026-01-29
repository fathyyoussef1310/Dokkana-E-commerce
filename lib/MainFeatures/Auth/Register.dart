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
      resizeToAvoidBottomInset: true,
      body:Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Imagesmanager.authImage),
              fit: BoxFit.cover,
            ),
          ),
          child:  Padding(
            padding:  REdgeInsets.all(18.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign up",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colorsmanager.White,
                      fontSize: 30.sp,
                    ),),
                    SizedBox(height: 27.h,),
                    Custometextforemfield(prefixIcon: CupertinoIcons.person_alt,hint: "Last Name", label: "Name", color: Colorsmanager.blackScreen),
                    SizedBox(height: 27.h,),
                    Custometextforemfield(prefixIcon: CupertinoIcons.mail_solid,hint: "Email", label: "Email", color: Colorsmanager.blackScreen),
                    SizedBox(height: 27.h,),
                    Custometextforemfield(prefixIcon:CupertinoIcons.lock_fill,hint: "Password", label: "Password", color: Colorsmanager.blackScreen),
                    SizedBox(height: 27.h,),
                    Custometextforemfield(prefixIcon: CupertinoIcons.lock_fill,suffixIcon: CupertinoIcons.eye_slash_fill,hint: "Confirm Password", label: "Confirm Password", color: Colorsmanager.blackScreen),
                    SizedBox(height: 27.h,),
                    CustomElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, RoutesManager.loginScreen);
                    }, title: "Sign In", backgroundColor: Colorsmanager.White, foregroundColor: Colorsmanager.blackScreen)
                  ],
                ),
              ),
            ),
          )
      )
    );
  }
}
