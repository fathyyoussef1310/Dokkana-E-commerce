import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBourdingNext extends StatelessWidget {
  const OnBourdingNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Imagesmanager.onbourdingNext),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Image.asset(Imagesmanager.onbourdingNextText, width: 250.w),
            SizedBox(height: 35.h),
            Image.asset(Imagesmanager.onbourdingNextTextDec, width: 250.w),
            SizedBox(height: 70.h),
            Opacity(
              opacity: 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.onboardingLets);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.whiteScaffoldScreen,
                  padding: EdgeInsets.symmetric(
                    horizontal: 90.w,
                    vertical: 8.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Next',
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
