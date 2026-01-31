import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/Common Widgets/ColorsManager.dart';

class Favouritesitem extends StatelessWidget {
  const Favouritesitem({
    super.key,
    required this.info,
    required this.image,
    required this.price,
    required this.onDelete,
  });

  final String info;
  final String image;
  final String price;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colorsmanager.White,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colorsmanager.blackScreen.withOpacity(0.05),
            blurRadius: 10.sp,
          )
        ],
      ),
      child: ListTile(
        contentPadding: REdgeInsets.all(10.r),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(image!,
            width: 60.w,
            height: 60.w,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(info!, style: GoogleFonts.aboreto(color: Colorsmanager.blackScreen, fontSize: 14.sp, fontWeight: FontWeight.bold,),
        ),
        subtitle: Text("$price EGP"!, style: GoogleFonts.inter(color: Colors.orange, fontWeight: FontWeight.w600),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline, color: Colorsmanager.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}