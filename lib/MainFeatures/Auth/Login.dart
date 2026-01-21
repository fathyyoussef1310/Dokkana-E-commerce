import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Common Widgets/ColorsManager.dart';
import '../../Core/Common Widgets/CustomeTextButtom.dart';
import '../../Core/Common Widgets/CustomeTextForemfield.dart';
import '../../Core/Common Widgets/ImagesManager.dart';
import '../../Core/Common Widgets/RoutesManager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imagesmanager.authImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dokkan",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colorsmanager.White,
              fontSize: 40.sp,
            ),),
            SizedBox(height: 10.h,),
            Text("Sign In",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colorsmanager.White
            ),),
            Custometextforemfield(prefixIcon: CupertinoIcons.mail_solid,hint: "Email", label: "Email", color: Colorsmanager.blackScreen),
            SizedBox(height: 33.h,),
            Custometextforemfield(prefixIcon:CupertinoIcons.lock_fill,hint: "Password", label: "Password", color: Colorsmanager.blackScreen),
            SizedBox(height: 29.h,),
            CustomElevatedButton(onPressed: (){
              // to Layout
              Navigator.pushNamed(context, RoutesManager.layoutScreen);
            }, title: "Sign In", backgroundColor: Colorsmanager.White, foregroundColor: Colorsmanager.blackScreen)
          ],
        ),
    )
    );
  }
}
