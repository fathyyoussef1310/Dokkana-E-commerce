import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/Favourites/FavouritesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Favouritesmanager>(context);
    final favitems = provider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorites", style: GoogleFonts.aboreto(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colorsmanager.blackScreen,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: favitems.isEmpty
          ? Center(
        child: Text(
          "Please add favorites first",
          style: GoogleFonts.k2d(fontSize: 18.sp, color: Colors.grey),
        ),
      )
          : ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: favitems.length,
        separatorBuilder: (context, index) => SizedBox(height: 15.h),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(10.r),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  favitems[index]["image"]!,
                  width: 60.w,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(favitems[index]["info"]!, style: GoogleFonts.aboreto(color: Colorsmanager.blackScreen, fontSize: 14.sp, fontWeight: FontWeight.bold,),),
              subtitle: Text("${favitems[index]["Price"]} EGP", style: GoogleFonts.inter(color: Colors.orange, fontWeight: FontWeight.w600),),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline, color: Colorsmanager.red),
                onPressed: () {
                  provider.toggleData(
                    favitems[index]["image"]!,
                    favitems[index]["info"]!,
                    favitems[index]["Price"]!,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}