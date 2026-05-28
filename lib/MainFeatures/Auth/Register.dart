import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextButtom.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextForemfield.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/data/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController ConfirmPasswordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
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
                    Custometextforemfield(
                        prefixIcon: CupertinoIcons.person_alt,
                        hint: "Last Name",
                        label: "Name",
                        color: Colorsmanager.blackScreen,
                        controller: usernameController,
                    ),
                    SizedBox(height: 27.h,),
                    Custometextforemfield(
                        prefixIcon: CupertinoIcons.mail_solid,
                        hint: "Email",
                        label: "Email",
                        color: Colorsmanager.blackScreen,
                        controller: emailController,
                    ),
                    SizedBox(height: 27.h,),
                    Custometextforemfield(prefixIcon:CupertinoIcons.lock_fill,
                        hint: "Password",
                        label: "Password",
                        color: Colorsmanager.blackScreen,
                        controller: passwordController,
                    ),
                    SizedBox(height: 27.h,),
                    Custometextforemfield(
                        prefixIcon: CupertinoIcons.lock_fill,
                        suffixIcon: CupertinoIcons.eye_slash_fill,
                        hint: "Confirm Password",
                        label: "Confirm Password",
                        color: Colorsmanager.blackScreen,
                        controller: ConfirmPasswordController,
                    ),
                    SizedBox(height: 27.h,),
                    BlocConsumer<AuthCubit,AuthState>(
                    listener: (context, state) {
                      if(state is AuthSuccess){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colorsmanager.green, content: Text("Account created successfully",style: TextStyle(
                            color: Colorsmanager.whiteCoffee,
                        ),
                        )
                        )
                        );
                        Navigator.pushReplacementNamed(context, RoutesManager.loginScreen);
                      }
                      if(state is AuthError){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colorsmanager.red,
                            content:Text("Error in Registration:${state.message}",style: TextStyle(color: Colorsmanager.White),) ));
                      }
                    },
                    builder: (context, state) {
                      if(state is AuthLoading){
                        return CircularProgressIndicator(color: Colorsmanager.coffeeCheckout);
                      }
                      return CustomElevatedButton(
                        onPressed: () {
                          if( passwordController.text != ConfirmPasswordController.text){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colorsmanager.red,
                                content: Text("Passwords do not match", style: TextStyle(
                                    color: Colorsmanager.White,
                                  ),
                                ),
                              ),
                            );
                            return ;
                          }
                          context.read<AuthCubit>().register(
                            usernameController.text,
                            passwordController.text,
                            "USER",
                            emailController.text,
                          );
                        },
                        title: "SignUp",
                        backgroundColor: Colorsmanager.coffeeCheckout,
                        foregroundColor: Colorsmanager.blackScreen,
                      );
                    },
)
                  ],
                ),
              ),
            ),
          )
      )
    );
  }
}
