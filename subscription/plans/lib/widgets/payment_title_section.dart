import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentTitleSection extends StatelessWidget {
  const PaymentTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Options',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          'Pay by any UPI app',
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
