import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentTopBar extends StatelessWidget {
  const PaymentTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).maybePop(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20.sp,
            color: Colors.black87,
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          'Payment',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
