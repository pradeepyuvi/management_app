import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileItem({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.w),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: Colors.black),
            SizedBox(width: 2.w),
            Text(
              label,
              style: TextStyle(fontSize: 15.sp, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
