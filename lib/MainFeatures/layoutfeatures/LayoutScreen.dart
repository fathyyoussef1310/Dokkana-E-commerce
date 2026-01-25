import 'package:dokkanaproject/MainFeatures/layoutfeatures/Favourites/Favourites.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Core/Common Widgets/ColorsManager.dart';
import 'HomeScreen/HomeScreen.dart';
import 'cart/my_cart/edit_cart.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<Widget> _tabs = [
    Homescreen(),
    FavouritesScreen(),
    EditCart(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _tabs[_selectedIndex],
      bottomNavigationBar: Padding(
        padding:  REdgeInsets.all(20.0),
        child: Container(
          padding:  REdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colorsmanager.blackScreen,
            borderRadius: BorderRadius.circular(70.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIcon(Icons.home_filled, 0),
              _buildIcon(CupertinoIcons.heart, 1),
              _buildIcon(CupertinoIcons.cart_fill, 2),
              _buildIcon(CupertinoIcons.profile_circled, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding:  REdgeInsets.all(12.r),
        child: Icon(icon, color: isSelected ? Colorsmanager.darkpinkScreen: Colorsmanager.White,
          size: 38.sp,
        ),
      ),
    );
  }
}