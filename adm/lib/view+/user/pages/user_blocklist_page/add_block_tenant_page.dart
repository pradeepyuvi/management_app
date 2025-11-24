import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/user_pg_text_field.dart';

class AddBlockTenantPage extends StatelessWidget {
  const AddBlockTenantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f4ff),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Add Blocked Person',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------- MAIN CARD (like Customer Details) ----------
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFCDEDE7), // mint style header bg
                borderRadius: BorderRadius.circular(16.sp),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Row(
                    children: [
                      Icon(
                        Icons.person_off_outlined,
                        size: 18.sp,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        'Add Person Details',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),

                  // Name
                  UserPgTextField(hintText: 'Name', icon: Icons.person),
                  SizedBox(height: 1.5.h),

                  // Phone
                  UserPgTextField(
                    hintText: 'Phone No',
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                  ),
                  SizedBox(height: 1.5.h),

                  // Reason
                  UserPgTextField(
                    hintText: 'Reason',
                    icon: Icons.report_problem_outlined,
                  ),
                  SizedBox(height: 2.h),

                  // Upload photo placeholder
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 1.8.h,
                      horizontal: 3.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1.1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_camera_outlined,
                          size: 18.sp,
                          color: Colors.grey.shade700,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          'Upload Photo (UI only)',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 3.h),

            // --------- SUBMIT BUTTON ----------
            Center(
              child: SizedBox(
                width: 60.w,
                height: 6.h,
                child: ElevatedButton(
                  onPressed: () {
                    // UI only – no action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
