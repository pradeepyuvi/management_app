import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeatureIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22.sp, color: Colors.white),
          SizedBox(height: 0.8.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white.withOpacity(0.95),
              height: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
