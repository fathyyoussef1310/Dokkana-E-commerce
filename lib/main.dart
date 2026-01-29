import 'package:dokkanaproject/MainFeatures/layoutfeatures/Favourites/FavouritesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // 1. Added GetX import
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Confiq/ThemeController.dart';
import 'Confiq/ThemeManager.dart';
import 'Core/Common Widgets/RoutesManager.dart';
import 'MainFeatures/Auth/Register.dart';
import 'MainFeatures/onbourding/on_bourding_next.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> Favouritesmanager())
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.getRoute,
            theme: ThemeManager.light,
            darkTheme: ThemeManager.dark,
            themeMode: themeController.themeMode,
            home: FutureBuilder<bool>(
              future: _checkFirstTime(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasData) {
                  return snapshot.data! ? OnBourdingNext() : RegisterScreen();
                } else {
                  return OnBourdingNext();
                }
              },
            ),
          );
        },
      ),
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