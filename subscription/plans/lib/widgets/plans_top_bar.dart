import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlansTopBar extends StatelessWidget {
  const PlansTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).maybePop(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 2.w),
        Icon(Icons.auto_awesome, size: 20.sp, color: Colors.white),
      ],
    );
  }
}
