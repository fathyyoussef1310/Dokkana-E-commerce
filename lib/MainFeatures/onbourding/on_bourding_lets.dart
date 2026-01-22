import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBourdingLets extends StatelessWidget {
  const OnBourdingLets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imagesmanager.onbourdingLets),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Image.asset(Imagesmanager.onbourdingLetsText, width: 250.w),
            SizedBox(height: 35.h),
            Image.asset(Imagesmanager.onbourdingLetsTextDec, width: 250.w),
            SizedBox(height: 60.h),
            Opacity(
              opacity: 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.registerScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.White,
                  padding: EdgeInsets.symmetric(
                    horizontal: 90.w,
                    vertical: 8.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Shop',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h,),
            Opacity(
              opacity: 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.registerScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.White,
                  padding: EdgeInsets.symmetric(
                    horizontal: 90.w,
                    vertical: 8.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
