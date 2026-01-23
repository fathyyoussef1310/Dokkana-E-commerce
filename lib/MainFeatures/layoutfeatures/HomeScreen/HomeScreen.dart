import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeSearchBar.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/HomeScreen/Catagories_Home_Items.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/HomeScreen/OffersAlert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Offersalert>offers=[
    Offersalert(),
    Offersalert(),
    Offersalert(),
    Offersalert(),
    Offersalert(),
    Offersalert(),
  ];
  List<CatagoriesHomeItems>catagories=[
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
    CatagoriesHomeItems(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text("Dokkan", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colorsmanager.blackScreen),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.all(17.0.sp),
              child: CustomeSearchbar(
                backgroundcolor: Colorsmanager.darkpinkScreen,
                forgroundcolor: Colorsmanager.blackScreen,
                label: "Search....",
                prefixIcon: CupertinoIcons.search,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: REdgeInsets.all(12.0.sp),
                  child: Text("Special Offers", style: GoogleFonts.khula(color: Colorsmanager.blackScreen, fontWeight: FontWeight.bold, fontSize: 18.sp),),
                ),
                Padding(
                  padding: REdgeInsets.all(12.0.sp),
                  child: Text("See More", style: GoogleFonts.khula(color: Colorsmanager.blackScreen, fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150.h,
              child: Padding(
                padding:  REdgeInsets.all(3.0.r),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) {
                  return offers[index];
                }, separatorBuilder: (context,index)=> SizedBox(width: 10.w,) , itemCount: offers.length),
              ),
            ),
            Padding(
              padding: REdgeInsets.all(17.r),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.7,
              ),
                  itemBuilder: (context,index){
                return catagories[index];
                  },itemCount: catagories.length,),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}