import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 50.h,
            child: Container(
              decoration: BoxDecoration(
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
                    Text(
                      'Check Your Mobile',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'OTP will be sent to your registered mobile number.',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white70),
                    ),
                    SizedBox(height: 5.h),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 8.h,
                        fieldWidth: 15.w,
                        activeFillColor: Colors.white24,
                        inactiveFillColor: Colors.white24,
                        selectedFillColor: Colors.white24,
                        activeColor: Colors.white,
                        selectedColor: Colors.white,
                        inactiveColor: Colors.white54,
                        borderWidth: 0,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 1.h),
                    Center(
                      child: Text(
                        'This code will expire in 5 minutes',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 52.h - 5.5.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 6.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                    ),
                    child: Text(
                      'Verify Code',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 2.h),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pop(); // This will close the dialog
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'OTP will be re-sent to your registered mobile.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      color: Colors.deepPurple[900],
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                SizedBox(height: 2.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'By continuing you confirm that you agree with our Terms and Conditions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 15.sp),
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
