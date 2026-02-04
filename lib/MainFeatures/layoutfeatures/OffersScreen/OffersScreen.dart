import 'package:dokkanaproject/Core/Common%20Widgets/ImagesManager.dart';
import 'package:dokkanaproject/Core/Common%20Widgets/RoutesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/OffersScreen/OffersCatagories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Favourites/FavouritesManager.dart';
class Offersscreen extends StatefulWidget {
  const Offersscreen({super.key});
  @override
  State<Offersscreen> createState() => _OffersscreenState();
}

class _OffersscreenState extends State<Offersscreen> {
 late final List<Offerscatagories>catagories=[
   Offerscatagories(onPress: () {
     Navigator.pushNamed(context, RoutesManager.catagoriesDetails);
   }, image: Imagesmanager.shoeitem ,Price: 1000, sale: 20, info: 'Adidas A50GrayVersion',),
   Offerscatagories(onPress: () {
     Navigator.pushNamed(context, RoutesManager.catagoriesDetails);
   }, image: Imagesmanager.shoeitem ,Price: 1001111, sale: 40, info: 'Adidas A50GrayVersion',),
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text("Offers",style: GoogleFonts.aboreto(fontSize: 19.sp,fontWeight: FontWeight.bold),),
      ),
      body: catagories.isEmpty ? Center(child: Text("No offersAvailble"),): ListView.separated(
          itemBuilder: (context,index)
          {
            final offer=catagories[index];
            return Offerscatagories(onPress: offer.onPress, image: offer.image, Price: offer.Price, sale: offer.sale, info: offer.info,);
          },
          separatorBuilder: (context,index)=> SizedBox(height: 6.h,), itemCount:catagories.length),
    );
  }
}
