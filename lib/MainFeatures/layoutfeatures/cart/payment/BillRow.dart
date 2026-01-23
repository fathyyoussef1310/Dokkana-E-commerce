import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;

  const BillRow(
      this.title,
      this.value, {
        super.key,
        this.isBold = false,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
