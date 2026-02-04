import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Favourites/FavouritesManager.dart';

class Offerscatagories extends StatefulWidget {
  const Offerscatagories({
    super.key,
    required this.onPress,
    required this.image,
    required this.Price,
    required this.sale,
    required this.info,
  });

  final VoidCallback onPress;
  final String image;
  final int Price;
  final int sale;
  final String info;

  @override
  State<Offerscatagories> createState() => _OfferscatagoriesState();
}

class _OfferscatagoriesState extends State<Offerscatagories> {
  bool isSelected = false;
   double get finalPrice {
    double discount = widget.Price * (widget.sale / 100);
    return widget.Price - discount;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Padding(
        padding: REdgeInsets.all(8.0),
        child: Container(
          width: 90.w,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26.r),
            border: Border.all(color: Colorsmanager.gold),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Image.asset(widget.image, fit: BoxFit.contain),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                          final provider = Provider.of<Favouritesmanager>(context, listen: false);
                          provider.toggelData(widget.image, widget.info, finalPrice.toString());
                        },
                        icon: Icon(
                          isSelected ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                          color: Colorsmanager.gold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.info,
                        style: GoogleFonts.k2d(color: Colorsmanager.blackScreen,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text("EGP: ${widget.Price}", style: GoogleFonts.inter(color: Colors.grey, fontSize: 12.sp, decoration: TextDecoration.lineThrough,),),
                      Text("EGP: ${finalPrice.toInt()}", style: GoogleFonts.inter(color: Colorsmanager.blackScreen, fontSize: 15.sp, fontWeight: FontWeight.w900,),),
                      Text("${widget.sale}% OFF", style: GoogleFonts.inter(color: Colorsmanager.red, fontSize: 11.sp, fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}