import 'package:dokkanaproject/MainFeatures/Auth/Login.dart';
import 'package:dokkanaproject/MainFeatures/Auth/Register.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/LayoutScreen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/checkout/add_address_screen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/checkout/checkout_screen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/payment/payment_screen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/sammary/sammary_screen.dart';
import 'package:dokkanaproject/MainFeatures/onbourding/on_bourding_lets.dart';
import 'package:dokkanaproject/MainFeatures/onbourding/on_bourding_next.dart';

import 'package:flutter/material.dart';

class RoutesManager {
  static const String onboardingNext = '/onboardingnext';
  static const String onboardingLets = '/onboardinglets';
  static const String checkoutScreen = '/checkoutscreen';
  static const String paymentScreen = '/paymentscreen';
  static const String addAddressScreen = '/addaddressscreem';
  static const String sammaryScreen = '/sammaryscreen';
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
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_)=> LoginScreen());
      case onboardingNext:
        return MaterialPageRoute(builder: (_) => OnBourdingNext());
      case onboardingLets:
        return MaterialPageRoute(builder: (_) => OnBourdingLets());
      case layoutScreen:
        return MaterialPageRoute(builder: (_)=> LayoutScreen());
      case checkoutScreen:
        return MaterialPageRoute(builder: (_)=> CheckoutScreen());
      case paymentScreen:
        return MaterialPageRoute(builder: (_)=> PaymentScreen());
      case addAddressScreen:
        return MaterialPageRoute(builder: (_)=> AddAddressScreen());
      case sammaryScreen:
        return MaterialPageRoute(builder: (_)=> SammaryScreen());
    }
  }
}