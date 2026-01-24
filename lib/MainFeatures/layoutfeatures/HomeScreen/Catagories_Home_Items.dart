import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/HomeScreen/Catagoredetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Core/Common Widgets/ImagesManager.dart';

class CatagoriesHomeItems extends StatefulWidget {
  const CatagoriesHomeItems({super.key,required this.ImagePath, required this.info, required this.Price});
  final  String ImagePath;
  final String info;
  final String Price;
  @override
  State<CatagoriesHomeItems> createState() => _CatagoriesHomeItemsState();
}

class _CatagoriesHomeItemsState extends State<CatagoriesHomeItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (_) => Catagoredetails(ImagePath: widget.ImagePath, ShoesDetailes: widget.info, Price: widget.Price,)) as Route<Object?>);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colorsmanager.White,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colorsmanager.blackScreen.withOpacity(0.9)),
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
                    widget.ImagePath,
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
                    Text(widget.info, style: GoogleFonts.k2d(color: Colorsmanager.blackScreen, fontSize: 19.sp, fontWeight: FontWeight.w400,),
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
      ),
    );
  }
}