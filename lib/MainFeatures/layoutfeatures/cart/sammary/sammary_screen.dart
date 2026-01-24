import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SammaryScreen extends StatelessWidget {
  const SammaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor, // Keep consistent color
        title: Center(
          child: Text(
            'Checkout',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 0.h),
        decoration: BoxDecoration(
          color: Colorsmanager.gray,
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
                  color: Colorsmanager.White,
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
                                color: const Color.fromARGB(255, 174, 174, 174),
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
                                color: const Color.fromARGB(255, 174, 174, 174),
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
                child: Image.asset(
                  'assets/Images/map.png',
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colorsmanager.White,
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
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Images/paypal_logo.png',
                            width: 40.w,
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paypal Card',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                '**** **** 0696 4629',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color.fromARGB(
                                    255,
                                    174,
                                    174,
                                    174,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colorsmanager.darkGray,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal'),
                        SizedBox(width: 8.w),
                        Text('\$1240'),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shopping'),
                        SizedBox(width: 8.w),
                        Text('\$60'),
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
                        SizedBox(width: 8.w),
                        Text(
                          '\$1690',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesManager.paymentSuccessScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colorsmanager.blackScreen,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
