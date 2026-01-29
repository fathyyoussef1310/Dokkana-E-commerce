import 'package:dokkanaproject/MainFeatures/Auth/Login.dart';
import 'package:dokkanaproject/MainFeatures/Auth/Register.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/HomeScreen/Catagoredetails.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/LayoutScreen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/Mapping/GoogleMap.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/checkout/add_address_screen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/checkout/checkout_screen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/my_cart/edit_cart.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/payment/payment_screen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/payment_success/payment_success_screen.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/sammary/sammary_screen.dart';
import 'package:dokkanaproject/MainFeatures/onbourding/on_bourding_lets.dart';
import 'package:dokkanaproject/MainFeatures/onbourding/on_bourding_next.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const String onboardingNext = '/onboardingnext';
  static const String onboardingLets = '/onboardinglets';
  static const String editCart = '/editcart';
  static const String checkoutScreen = '/checkoutscreen';
  static const String paymentScreen = '/paymentscreen';
  static const String addAddressScreen = '/addaddressscreen';
  static const String sammaryScreen = '/sammaryscreen';
  static const String paymentSuccessScreen = '/paymentsuccessscreen';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String layoutScreen = '/layout';
  static const String homeScreen = '/home';
  static const String catagoriesDetails = '/details';
  static const String mapScreen='/Map';

  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case onboardingNext:
        return MaterialPageRoute(builder: (_) => const OnBourdingNext());
      case onboardingLets:
        return MaterialPageRoute(builder: (_) => const OnBourdingLets());
      case layoutScreen:
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case checkoutScreen:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case paymentScreen:
        return MaterialPageRoute(builder: (_) =>PaymentScreen());
      case addAddressScreen:
        return MaterialPageRoute(builder: (_) => const AddAddressScreen());
      case sammaryScreen:
        return MaterialPageRoute(builder: (_) => const SammaryScreen());
      case paymentSuccessScreen:
        return MaterialPageRoute(builder: (_) => const PaymentSuccessScreen());
      case catagoriesDetails:
        return MaterialPageRoute(builder: (_) => const Catagoredetails(ImagePath: '', ShoesDetailes: '', Price: '',));
      case mapScreen:
        return MaterialPageRoute(builder: (_)=> MapSample());
      case editCart:
        return MaterialPageRoute(builder: (_)=> EditCart());
    }
    return null;
  }
}
