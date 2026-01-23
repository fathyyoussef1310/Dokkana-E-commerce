import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget trailing;

  const PaymentRow({
    super.key,
    required this.icon,
    required this.text,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Icon(icon, size: 22),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
