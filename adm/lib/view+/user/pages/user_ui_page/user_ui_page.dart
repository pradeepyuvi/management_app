import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserUiPage extends StatelessWidget {
  const UserUiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f4ff),

      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "User UI",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),

      body: Center(
        child: Text(
          "PG Owner UI will display",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
