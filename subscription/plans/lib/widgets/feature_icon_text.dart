import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeatureIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center, // ⭐ IMPORTANT FIX
      children: [
        Icon(icon, size: 22.sp, color: Colors.white),
        SizedBox(height: 0.8.h),
        Text(
          text,
          textAlign: TextAlign.center, // ⭐ CENTER TEXT
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            height: 1.2,
            color: Colors.white.withOpacity(0.95),
          ),
        ),
      ],
    );
  }
}
