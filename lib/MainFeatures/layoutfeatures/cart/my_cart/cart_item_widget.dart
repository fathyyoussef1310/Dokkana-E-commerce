import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int count = 1;

  Widget circleButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(icon, size: 16.sp, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colorsmanager.White,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Image.asset(
                'assets/Images/yezzy.png',
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 100.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colorsmanager.White,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Adidas Yeezy SPLY 350 Sneakers',
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'size:07 |color: OLISTR',
                    style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w300),
                  ),
                  Text('\$200.00', style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            SizedBox(width: 10.w),
        
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Minus
                circleButton(
                  icon: Icons.remove,
                  onTap: () {
                    if (count > 1) {
                      setState(() => count--);
                    }
                  },
                ),
                SizedBox(height: 4.h),
                // Number
                Text(
                  count.toString().padLeft(2, '0'),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 4.h),
                // Plus
                circleButton(
                  icon: Icons.add,
                  onTap: () {
                    setState(() => count++);
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h,)
      ],
    );
  }
}
