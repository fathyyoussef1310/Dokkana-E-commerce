import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidgit extends StatelessWidget {
  const AddressWidgit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colorsmanager.gray,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Steve harrington',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20.h,),
          Text(
            'BCG vantage Building,uk 5214 street,jude town',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20.h,),
          Text(
            'Mobile : +25754857875',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.gray,
                  side: BorderSide(color: Colorsmanager.lightcoffeeScreen),
                  padding: EdgeInsets.symmetric(
                    horizontal: 55.w,
                    vertical: 6.h,
                  ),
                  minimumSize: Size(0, 0)
                ),

                child: Text(
                  'Remove',
                  style: TextStyle(
                    color: Colorsmanager.blackScreen,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 16.w,),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colorsmanager.gray,
                  side: BorderSide(color: Colorsmanager.lightcoffeeScreen),
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.w,
                    vertical: 6.h,
                  ),
                  minimumSize: Size(0, 0)
                ),

                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colorsmanager.blackScreen,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
