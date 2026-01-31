import 'package:dokkanaproject/Controllers/ThemeController.dart';
import 'package:dokkanaproject/Confiq/ThemeManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/CustomeSearchBar.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/HomeScreen/Catagories_Home_Items.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/HomeScreen/OffersAlert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Offersalert>offers=[
    Offersalert(ImagePath: Imagesmanager.Shoeoffer, Discountpercent: '30% OFF', ValidDays: 'For 3 Days', info: 'Get Discount for Every order.',),
    Offersalert(ImagePath: Imagesmanager.shoeitem, Discountpercent: '70% OFF', ValidDays: 'For 2 Days', info: 'Get Discount for Every order.',),
    Offersalert(ImagePath: Imagesmanager.Shoeoffer, Discountpercent: '10% OFF', ValidDays: "Today's Special", info: 'Get Discount for Every order.',),
    Offersalert(ImagePath: Imagesmanager.shoeitem, Discountpercent: '40% OFF', ValidDays: 'For 9 Days', info: 'Get Discount for Every order.',),
    Offersalert(ImagePath: Imagesmanager.Shoeoffer, Discountpercent: '10% OFF', ValidDays: 'Now', info: 'Get Discount for Every order.',),
  ];
  List<CatagoriesHomeItems>catagories=[
    CatagoriesHomeItems(ImagePath: Imagesmanager.shoeitem, info: "Nike AirForce Gray White",Price: '100',),
    CatagoriesHomeItems(ImagePath: Imagesmanager.Shoeoffer,info: "Nike AirForce Black Edition",Price: '200',),
    CatagoriesHomeItems(ImagePath: Imagesmanager.shoeitem, info: "Nike AirForce Gray White",Price: '300',),
    CatagoriesHomeItems(ImagePath: Imagesmanager.Shoeoffer,info: "Nike AirForce Black Edition", Price: '1111',),
    CatagoriesHomeItems(ImagePath: Imagesmanager.shoeitem, info: "Nike AirForce Gray White", Price: '900',),
    CatagoriesHomeItems(ImagePath: Imagesmanager.Shoeoffer,info: "Nike AirForce Black Edition", Price: '1000',),
    CatagoriesHomeItems(ImagePath: Imagesmanager.shoeitem, info: "Nike AirForce Gray White", Price: '11112',),
    CatagoriesHomeItems(ImagePath: Imagesmanager.Shoeoffer,info: "Nike AirForce Black Edition", Price: '10009',),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            Get.find<ThemeController>().toggletheme(true);
          }, icon: Icon(CupertinoIcons.moon_circle,size: 30.sp,)),
          IconButton(onPressed: (){
            Get.find<ThemeController>().toggletheme(false);
          }, icon: Icon(CupertinoIcons.light_max,size: 30.sp,))
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text("Dokkan", style: GoogleFonts.aboreto(fontWeight: FontWeight.bold, color: Colorsmanager.blackScreen),),
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
                  crossAxisSpacing: 11.w,
                  mainAxisSpacing: 5.h,
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