import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/my_cart/cart_item.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/my_cart/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SammaryScreen extends StatelessWidget {
  const SammaryScreen({super.key});

  Widget paymentWidget(String? paymentMethod) {
    if (paymentMethod == "cash") {
      return Row(
        children: [
          Icon(Icons.money, size: 40),
          SizedBox(width: 10),
          Text(
            "Cash",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      );
    }

    if (paymentMethod == "card") {
      return Row(
        children: [
          Icon(Icons.credit_card, size: 40),
          SizedBox(width: 10),
          Text(
            "Card",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      );
    }

    if (paymentMethod == "bank") {
      return Row(
        children: [
          Icon(Icons.account_balance, size: 40),
          SizedBox(width: 10),
          Text(
            "Bank",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ],
      );
    }

    return Row(
      children: [
        Image.asset('assets/Images/paypal_logo.png', width: 40.w),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              paymentMethod == "paypal" ? "Paypal Card" : "Unknown",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              paymentMethod == "paypal" ? "**** **** 0696 4629" : "",
              style: TextStyle(fontSize: 10.sp, color: Color(0xffAEAEAE)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethod = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Center(child: Text('Checkout')),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/email.svg'),
                        SizedBox(width: 32.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Steve Harrington@gmail.com',
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xffAEAEAE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/phone.svg'),
                        SizedBox(width: 32.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '+917025793482',
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              'Phone',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xffAEAEAE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Text('Address', style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 4.h),
              Text(
                'bcg vantage, 5t, London, 12908-UK',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 12.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/Images/map.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.mapScreen,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.only(left: 14.w),
                      child: paymentWidget(paymentMethod),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              ValueListenableBuilder<List<CartItem>>(
                valueListenable: CartService.instance.items,
                builder: (context, items, _) {
                  final subtotal = items.fold<double>(
                    0.0,
                    (prev, e) => prev + e.price * e.quantity,
                  );
                  final shipping = items.isNotEmpty ? 60.0 : 0.0;
                  final total = subtotal + shipping;

                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal'),
                            Text('\$${subtotal.toStringAsFixed(2)}'),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shopping'),
                            Text('\$${shipping.toStringAsFixed(2)}'),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Cost',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '\$${total.toStringAsFixed(2)}',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.paymentSuccessScreen,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            padding: EdgeInsets.symmetric(
                              horizontal: 70.w,
                              vertical: 2.h,
                            ),
                          ),
                          child: Text(
                            'Check Out',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colorsmanager.White,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
