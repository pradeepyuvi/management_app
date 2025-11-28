import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CurrentPlanCard extends StatelessWidget {
  const CurrentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.2.h, horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        gradient: const LinearGradient(
          colors: [Color(0xFF2D1B4F), Color(0xFF1B0F33)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Plan',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 0.6.h),
                Text(
                  'FREE TRIAL',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 0.6.h),
                Text(
                  '1 Month  •  ₹0.00',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: Colors.greenAccent, size: 22.sp),
        ],
      ),
    );
  }
}
