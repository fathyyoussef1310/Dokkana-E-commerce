import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/checkout/address_widgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Checkout',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [SvgPicture.asset('assets/svgs/location.svg')],),
            SizedBox(height: 18.h,),
            Text(
              'Shipping Address',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),
            Text(
              'Default Address',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 20.h),
            AddressWidgit(),
            SizedBox(height: 20.h),
            InkWell(
              onTap: (){Navigator.pushNamed(context, RoutesManager.addAddressScreen);},
              child: Row(
                children: [
                  SvgPicture.asset('assets/svgs/add.svg'),
                  SizedBox(width: 8.w),
                  Text('Add new addresses'),
                ],
              ),
            ),
            SizedBox(height: 200.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesManager.paymentScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colorsmanager.blackScreen,
                    padding: EdgeInsets.symmetric(
                      horizontal: 70.w,
                      vertical: 2.h,
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colorsmanager.White,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
