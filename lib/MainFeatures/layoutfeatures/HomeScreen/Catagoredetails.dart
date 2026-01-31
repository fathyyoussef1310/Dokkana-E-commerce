import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeTextButtom.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/my_cart/cart_item.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/my_cart/cart_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Catagoredetails extends StatefulWidget {
  const Catagoredetails({
    super.key,
    required this.ImagePath,
    required this.ShoesDetailes,
    required this.Price,
  });
  final String ImagePath;
  final String ShoesDetailes;
  final String Price;
  @override
  State<Catagoredetails> createState() => _CatagoredetailsState();
}

class _CatagoredetailsState extends State<Catagoredetails> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, RoutesManager.layoutScreen);
          },
          icon: Icon(CupertinoIcons.arrow_left),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Dokkan",
          style: GoogleFonts.aboreto(
            fontWeight: FontWeight.bold,
            color: Colorsmanager.blackScreen,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 379.08.w,
                height: 241.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Colorsmanager.lightcoffeeScreen.withOpacity(0.4),
                  ),
                  color: Colorsmanager.darkpinkScreen.withOpacity(0.1),
                ),
                child: ClipRRect(
                  child: Image.asset(
                    widget.ImagePath,
                    width: double.infinity,
                    height: 100.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              child: Container(
                width: 393.w,
                height: 505.h,
                decoration: BoxDecoration(
                  color: Colorsmanager.lightcoffeeScreen.withOpacity(0.29),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.r),
                    topRight: Radius.circular(19.r),
                  ),
                  border: Border.all(
                    color: Colorsmanager.darkpinkScreen.withOpacity(0.1),
                  ),
                ),
                child: Padding(
                  padding: REdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Different Colors",
                        style: GoogleFonts.khula(
                          color: Colorsmanager.blackScreen,
                          fontSize: 11.sp,
                        ),
                      ),
                      SizedBox(height: 60.h),
                      Text(
                        widget.ShoesDetailes,
                        style: GoogleFonts.aboreto(
                          color: Colorsmanager.blackScreen,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "⭐⭐⭐⭐4.1",
                        style: GoogleFonts.aboreto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Column(
                        children: [
                          Center(
                            child: Text(
                              "About",
                              style: GoogleFonts.aboreto(
                                color: Colorsmanager.blackScreen,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Brief Description for This Product",
                            maxLines: 5,
                            style: GoogleFonts.aboreto(
                              color: Colorsmanager.blackScreen,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "size",
                        style: GoogleFonts.khula(
                          color: Colorsmanager.blackScreen,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          _buildSizeChip("UK7"),
                          SizedBox(width: 10.w),
                          _buildSizeChip("UK8"),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Container(
                        width: 190.w,
                        height: 49.h,
                        decoration: BoxDecoration(
                          color: Colorsmanager.White,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            "Price:${widget.Price}",
                            style: GoogleFonts.aboreto(
                              color: Colorsmanager.blackScreen,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      CustomElevatedButton(
                        onPressed: () {
                          if (!isClicked) {
                            // construct cart item and add to cart
                            double parsedPrice = 0.0;
                            try {
                              parsedPrice = double.parse(
                                widget.Price.replaceAll(RegExp(r'[^0-9\.]'), ''),
                              );
                            } catch (_) {}
                            final cartItem = CartItem(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              title: widget.ShoesDetailes,
                              imagePath: widget.ImagePath,
                              size: '07',
                              color: 'N/A',
                              price: parsedPrice,
                            );
                            CartService.instance.addItem(cartItem);
                            setState(() {
                              isClicked = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Item added to bag')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Item already added')),
                            );
                          }
                        },
                        title: isClicked ? "ADDED" : "ADD TO BAG",
                        backgroundColor: isClicked ? Colorsmanager.lightcoffeeScreen : Colorsmanager.blackScreen,
                        foregroundColor: Colorsmanager.White,
                        PrefixIcon: CupertinoIcons.bag_badge_plus,
                      ),
                    ],
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

Widget _buildSizeChip(String label) {
  return Container(
    width: 60.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: Colorsmanager.darkpinkScreen,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Center(
      child: Text(
        label,
        style: TextStyle(
          color: Colorsmanager.White,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
