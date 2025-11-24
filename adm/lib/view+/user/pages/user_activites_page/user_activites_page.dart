import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/search_bar.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  // Dummy activities – UI only
  final List<String> activities = const [
    'New Customer Added - SNS PG (Pradeep)',
    'Rent Collected - SNS PG (Pradeep)',
    'Customer Checked Out - SkyLine PG (Ranjith)',
    'Room Updated - Comfort Stay PG (Ravi)',
    'Blocked Tenant - SNS PG (Pradeep)',
    'Unblocked Tenant - City Comfort PG (Kiran)',
    'New PG Added - City Comfort PG (Pradeep)',
    'Complaint Resolved - Comfort Stay PG (Ranjith)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Activities',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            /// 🔍 Search + Filter row
            Row(
              children: [
                Expanded(
                  child: UserSearchBar(
                    hintText: 'Search activities',
                    onChanged: (v) {},
                  ),
                ),
                SizedBox(width: 3.w),
                Container(
                  height: 5.2.h,
                  width: 11.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.filter_list,
                    size: 18.sp,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),

            SizedBox(height: 2.h),

            /// 🟦 BACKGROUND CARD WRAPPING THE LIST
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.sp),
                ),
                color: const Color.fromARGB(255, 110, 166, 160),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      final text = activities[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.9.h),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.7.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.sp),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
