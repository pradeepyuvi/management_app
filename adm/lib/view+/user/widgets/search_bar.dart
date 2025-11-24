import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const UserSearchBar({super.key, this.hintText = "Search...", this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 12.sp),
        decoration: InputDecoration(
          icon: Icon(Icons.search, size: 18.sp, color: Colors.grey),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15.sp, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
