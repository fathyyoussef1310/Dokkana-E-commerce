import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/Common Widgets/ColorsManager.dart';
class Offersalert extends StatefulWidget {
  const Offersalert({super.key, required this.ImagePath, required this.Discountpercent, required this.ValidDays, required this.info});
  final String ImagePath;
  final String Discountpercent;
  final String ValidDays;
  final String info;

  @override
  State<Offersalert> createState() => _OffersalertState();
}

class _OffersalertState extends State<Offersalert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 119.h,
      margin: REdgeInsets.all(1.r),
      decoration: BoxDecoration(
        color: Colorsmanager.blackScreen,
        borderRadius: BorderRadius.circular(19.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.Discountpercent, style: GoogleFonts.inter(color: Colorsmanager.coffeeCheckout, fontWeight: FontWeight.bold, fontSize: 20.sp)),
                  Text(widget.ValidDays, style: GoogleFonts.inter(color: Colorsmanager.coffeeCheckout, fontWeight: FontWeight.w600, fontSize: 16.sp)),
                  SizedBox(height: 5.h),
                  Text(widget.info, style: GoogleFonts.inter(color: Colorsmanager.coffeeCheckout, fontSize: 11.sp), maxLines: 3, overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            child: Image.asset(
              widget.ImagePath,
              width: 120.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}