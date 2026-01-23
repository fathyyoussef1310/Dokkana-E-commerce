import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Core/Common Widgets/ImagesManager.dart';

class CatagoriesHomeItems extends StatelessWidget {
  const CatagoriesHomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colorsmanager.White,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colorsmanager.blackScreen.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              child: Container(
                width: double.infinity,
                color: Colorsmanager.gray,
                child: Image.asset(
                  Imagesmanager.shoeitem,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nike Air Force, Gray white", style: GoogleFonts.inter(color: Colorsmanager.blackScreen, fontSize: 12.sp, fontWeight: FontWeight.bold,),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text("200 EGP", style: GoogleFonts.inter(color: Colorsmanager.blackScreen, fontSize: 14.sp, fontWeight: FontWeight.w900,),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}