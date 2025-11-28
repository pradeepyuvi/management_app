import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentBottomButton extends StatelessWidget {
  final int selectedIndex;

  const PaymentBottomButton({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final String methodName = _methodName(selectedIndex);

    return SizedBox(
      width: double.infinity,
      height: 6.5.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          'Pay with $methodName',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  String _methodName(int index) {
    switch (index) {
      case 0:
        return 'Google Pay';
      case 1:
        return 'PhonePe UPI';
      case 2:
        return 'Paytm UPI';
      case 3:
        return 'Amazon Pay UPI';
      default:
        return 'UPI';
    }
  }
}
