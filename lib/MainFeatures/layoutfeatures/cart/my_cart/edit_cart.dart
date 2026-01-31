import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/my_cart/cart_item_widget.dart';
import 'cart_service.dart';
import 'cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditCart extends StatelessWidget {
  const EditCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 130.w),
            Text(
              'My Cart',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset('assets/svgs/notifications.svg'),
          SizedBox(width: 20.w),
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
          ),
          child: IntrinsicHeight(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colorsmanager.gray,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 14.h,),
                  ValueListenableBuilder<List<CartItem>>(
                    valueListenable: CartService.instance.items,
                    builder: (context, items, _) {
                      if (items.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Center(child: Text('Your cart is empty')),
                        );
                      }
                      return Column(
                        children: items.map((e) => CartItemWidget(item: e)).toList(),
                      );
                    },
                  ),
                  Spacer(),
                  
                  ValueListenableBuilder<List<CartItem>>(
                    valueListenable: CartService.instance.items,
                    builder: (context, items, _) {
                      final subtotal = items.fold<double>(0.0, (prev, e) => prev + e.price * e.quantity);
                      final shipping = items.isNotEmpty ? 60.0 : 0.0;
                      final total = subtotal + shipping;
                      return Container(
                        // sum sheet
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2.3,
                        decoration: BoxDecoration(
                          color: Colorsmanager.coffeeCheckout,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.r),
                            topRight: Radius.circular(32.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 130.w),
                                  Text(
                                    '\$${subtotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Shopping',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 130.w),
                                  Text(
                                    '\$${shipping.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                color: Colorsmanager.blackScreen,
                                height: 1.25.h,
                                width: 270.w,
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total Cost',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 100.w),
                                  Text(
                                    '\$${total.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesManager.checkoutScreen,
                                  );
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
