import 'package:dokkanaproject/Core/Common Widgets/ColorsManager.dart';
import 'package:dokkanaproject/Core/Common Widgets/RoutesManager.dart';
import 'package:dokkanaproject/MainFeatures/layoutfeatures/cart/checkout/address_widgit.dart';
import 'package:dokkanaproject/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  AddressModel? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Checkout',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svgs/location.svg',color: Theme.of(context).secondaryHeaderColor,),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                'Shipping Address',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.h),
              Text(
                'Default Address',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.h),

              if (address != null)
                AddressWidgit(
                  address: address!,
                  onRemove: () {
                    setState(() {
                      address = null;
                    });
                  },
                  onEdit: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      RoutesManager.addAddressScreen,
                    );

                    if (result != null) {
                      setState(() {
                        address = result as AddressModel;
                      });
                    }
                  },
                ),

              SizedBox(height: 20.h),

              InkWell(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    RoutesManager.addAddressScreen,
                  );

                  if (result != null) {
                    setState(() {
                      address = result as AddressModel;
                    });
                  }
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svgs/add.svg',color: Theme.of(context).secondaryHeaderColor,),
                    SizedBox(width: 8.w),
                    const Text('Add new addresses'),
                  ],
                ),
              ),

              SizedBox(height: 200.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (address == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please add address first"),
                          ),
                        );
                        return;
                      }

                      Navigator.pushNamed(
                        context,
                        RoutesManager.paymentScreen,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorDark,
                      padding: EdgeInsets.symmetric(
                        horizontal: 70.w,
                        vertical: 2.h,
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colorsmanager.White,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
