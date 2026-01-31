// import 'package:dokkanaproject/Core/Common%20Widgets/ColorsManager.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../Favourites/FavouritesManager.dart';
// import '../HomeScreen/Catagoredetails.dart';
//
// class Offersitems extends StatelessWidget {
//    Offersitems({super.key, required this.ImagePath, required this.info, required this.Price});
//   final  String ImagePath;
//   final String info;
//   final String Price;
//   bool isSelected=false;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         Navigator.push(context, CupertinoPageRoute(builder: (_) => Catagoredetails(ImagePath:widget.ImagePath, ShoesDetailes: widget.info, Price: widget.Price,)) as Route<Object?>);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colorsmanager.White,
//           borderRadius: BorderRadius.circular(15.r),
//           border: Border.all(color: Colorsmanager.blackScreen.withOpacity(0.9)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colorsmanager.gray,
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(8.r),
//                       child: Image.asset(widget.ImagePath, fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     child: IconButton(onPressed: () {
//                       setState(() {
//                         isSelected=!isSelected;
//                       });
//                       final provider=Provider.of<Favouritesmanager>(context,listen: false);
//                       provider.toggleData(widget.ImagePath, widget.info, widget.Price);
//                     }, icon: Icon(isSelected ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
//                       color: isSelected ? Colors.orange : Colorsmanager.blackScreen,),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: EdgeInsets.all(8.r),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(widget.info, style: GoogleFonts.k2d(color: Colorsmanager.blackScreen, fontSize: 19.sp, fontWeight: FontWeight.w400,),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const Spacer(),
//                     Text("EGP:${widget.Price}", style: GoogleFonts.inter(color: Colorsmanager.blackScreen, fontSize: 14.sp, fontWeight: FontWeight.w900,),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
