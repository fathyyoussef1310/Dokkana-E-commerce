import 'package:dokkanaproject/MainFeatures/layoutfeatures/LayoutScreen.dart';
import 'package:dokkanaproject/data/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Common Widgets/ColorsManager.dart';
import '../../Core/Common Widgets/CustomeTextButtom.dart';
import '../../Core/Common Widgets/CustomeTextForemfield.dart';
import '../../Core/Common Widgets/ImagesManager.dart';
import '../../Core/Common Widgets/RoutesManager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
            Text("Sign In",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colorsmanager.White,
                fontSize: 29.sp
            ),),
            SizedBox(height: 30.h,),
            Padding(
              padding:  REdgeInsets.all(17.sp),
              child: Custometextforemfield(prefixIcon: CupertinoIcons.mail_solid,
                  hint: "UserName",
                  label: "UserName",
                  color: Colorsmanager.blackScreen,
                  controller: usernameController,
              ),
            ),
            Padding(
              padding:  REdgeInsets.all(17.sp),
              child: Custometextforemfield(
                  prefixIcon:CupertinoIcons.lock_fill,
                  hint: "Password",
                  label: "Password",
                  color: Colorsmanager.blackScreen,
                  controller: passwordController,
              ),
            ),
            SizedBox(height: 29.h,),
            BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is AuthSuccess){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful✔️✔️"),
        backgroundColor: Colorsmanager.green,
        animation: CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeInOut,
        ),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
        builder: (_) => LayoutScreen(),
      ),
            (route) => false,
      );
    }
    if(state is AuthError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed${state.message}"),
        backgroundColor: Colorsmanager.red,
       animation: CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeInOut,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),),
      ),
      );
    }
  },
  builder: (context, state) {
    return CustomElevatedButton(onPressed: (){
              context.read<AuthCubit>().login(usernameController.text, passwordController.text);
            },
        title: "Sign In",
        backgroundColor: Colorsmanager.whiteCoffee,
        foregroundColor: Colorsmanager.blackScreen);
  },
)
          ],
        ),
    )
    );
  }
}
