import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ComplaintDetailsPage extends StatelessWidget {
  final String pgName;
  final String address;
  final String owner;
  final String phone;
  final String issue;

  const ComplaintDetailsPage({
    super.key,
    required this.pgName,
    required this.address,
    required this.owner,
    required this.phone,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f4ff),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Complaint Details",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDDF8E9), Color(0xFFC4E8F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ---------- PG NAME ----------
                Text(
                  pgName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h),

                /// ---------- ADDRESS ----------
                _twoColumnRow(
                  icon: Icons.location_on_outlined,
                  label: "Address",
                  value: address,
                ),
                SizedBox(height: 0.5.h),

                /// ---------- MAPS LINK ----------
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "View on Maps",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),

                /// ---------- OWNER ----------
                _twoColumnRow(
                  icon: Icons.person_outline,
                  label: "Owner",
                  value: owner,
                ),
                SizedBox(height: 2.h),

                /// ---------- PHONE ----------
                _twoColumnRow(icon: Icons.call, label: "Phone", value: phone),
                SizedBox(height: 3.h),

                /// ---------- ISSUE (FULL WIDTH) ----------
                Text(
                  "Issue",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 1.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.sp),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Text(
                    issue,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: 3.h),

                /// ---------- SOLVED BUTTON ----------
                Center(
                  child: SizedBox(
                    width: 60.w,
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Mark as Solved",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// -------------------- 2-COLUMN ROW --------------------
  Widget _twoColumnRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ICON + LABEL (LEFT COLUMN)
        SizedBox(
          width: 30.w,
          child: Row(
            children: [
              Icon(icon, size: 16.sp, color: Colors.black87),
              SizedBox(width: 2.w),
              Text(
                label,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),

        /// VALUE (RIGHT COLUMN)
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
