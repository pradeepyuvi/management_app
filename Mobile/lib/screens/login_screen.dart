import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'otp.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top container with purple background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 70.h,
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.deepPurple[900],
                color: Colors.teal,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Center(
                      child: Container(
                        height: 18.h,
                        width: 18.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(2.h),
                        child: Image.asset(
                          'lib/assets/logo1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Sign in with your Registered Mobile to continue.',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white70),
                    ),
                    SizedBox(height: 3.h),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Mobile Number',
                        hintStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom button and terms text
          Positioned(
            top: 71.h - 5.5.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                  width: 8.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Otp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Square with rounded corners
                      ),
                      backgroundColor: Colors.white,
                      elevation: 6,
                      padding: EdgeInsets.zero,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.teal,
                      size: 5.h,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Don't have Account? Sign Up",
                    style: TextStyle(
                      color: Colors.deepPurple[900],
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'By continuing you confirm that you agree with our Terms and Conditions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
