import 'package:dokkanaproject/Confiq/ThemeManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/Common Widgets/RoutesManager.dart';
import 'BillRow.dart';
import 'PaymentRow.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/payment.svg')
              ],
            ),
            SizedBox(height: 18.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colorsmanager.White,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  PaymentRow(
                    icon: Icons.payments_outlined,
                    text: 'Cash on Delivery (Cash/UPI)',
                    trailing: const Icon(Icons.circle_outlined),
                  ),
                  Divider(),
                  PaymentRow(
                    icon: Icons.credit_card,
                    text: 'Credit/Debit Card',
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  ),
                  Divider(),
                  PaymentRow(
                    icon: Icons.account_balance_wallet_outlined,
                    text: 'Google Pay/Paypal',
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  ),
                  Divider(),
                  PaymentRow(
                    icon: Icons.account_balance,
                    text: 'Net Banking',
                    trailing: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colorsmanager.coffeeCheckout,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bill Details',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  BillRow('Subtotal (2 items)', '\$850'),
                  SizedBox(height: 8.h),
                  BillRow('Shipping address', '\$60'),
                  Divider(height: 24.h),
                  BillRow('Total', '\$952', isBold: true),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.blackScreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                      context, RoutesManager.sammaryScreen);
                },
                child: Text(
                  'Place order',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colorsmanager.White,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

