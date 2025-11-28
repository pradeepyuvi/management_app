import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlansBottomBar extends StatelessWidget {
  final String price;
  final String duration;
  final VoidCallback onContinue;

  const PlansBottomBar({
    super.key,
    required this.price,
    required this.duration,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1.8.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              Text(
                duration,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
            ],
          ),

          SizedBox(width: 5.w),

          Expanded(
            child: SizedBox(
              height: 6.5.h,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC857),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  'Proceed to Pay',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
