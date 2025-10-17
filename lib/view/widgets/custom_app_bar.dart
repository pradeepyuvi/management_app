import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget customAppBar({
  required String title,
  bool showBackButton = true,
  VoidCallback? onBack,
}) {
  return AppBar(
    backgroundColor: Colors.teal, // your single place for AppBar color
    elevation: 0,
    centerTitle: true,
    leading: showBackButton
        ? IconButton(
            icon: Icon(Icons.arrow_back, size: 18.sp, color: Colors.black),
            onPressed: onBack,
          )
        : null,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  );
}
