import 'package:dokkanaproject/MainFeatures/layoutfeatures/HomeScreen/HomeScreen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/LayoutScreen.dart';
import 'package:dokkanaproject/MainFeatures/onbourding/on_bourding_next.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Core/Common Widgets/RoutesManager.dart';
import 'MainFeatures/Auth/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.getRoute,
          themeMode: ThemeMode.system,
          home: FutureBuilder<bool>(
            future: _checkFirstTime(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasData) {
                bool isFirstTime = snapshot.data!;
                if (isFirstTime) {
                  return OnBourdingNext();
                } else {
                  return RegisterScreen();
                }
              } else {
                return OnBourdingNext(); // Default to onboarding on error
              }
            },
          ),
        );
      },
    );
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
    return isFirstTime;
  }
}
