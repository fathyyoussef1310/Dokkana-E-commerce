import 'package:dokkanaproject/MainFeatures/Auth/Register.dart';
import 'package:dokkanaproject/MainFeatures/onbourding/on_bourding_lets.dart';
import 'package:dokkanaproject/MainFeatures/onbourding/on_bourding_next.dart';
import 'package:flutter/cupertino.dart';

class RoutesManager {
  static const String onboardingNext = '/onboardingnext';
  static const String onboardingLets = '/onboardinglets';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgetPass = '/forgetPass';
  static const String profileScreen = '/profile';
  static const String layoutScreen = '/layout';
  static const String homeScreen = '/home';
  static const String favorites = '/favourites';

  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case registerScreen:
        return CupertinoPageRoute(builder: (_) => RegisterScreen());
      case onboardingNext:
        return CupertinoPageRoute(builder: (_) => OnBourdingNext());
      case onboardingLets:
        return CupertinoPageRoute(builder: (_) => OnBourdingLets());
    }
  }
}
