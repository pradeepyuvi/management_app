import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentDivider extends StatelessWidget {
  const PaymentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Divider(height: 0, thickness: 0.6, color: Colors.grey[300]),
    );
  }
}
