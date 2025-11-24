import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/tenant_card.dart';
import 'package:adm/view+/user/widgets/search_bar.dart';
import 'package:adm/view+/user/widgets/filter_dropdown.dart';
import 'package:adm/view+/user/pages/user_complaints_page/complaints_details_page.dart';

/// ------------ MODEL ------------
class ComplaintItem {
  final String pgName;
  final String owner;
  final String phone;
  final String date;
  final String issue;
  final String address;
  final String imageUrl;
  final bool isResolved; // 🔹 for RESOLVED / NOT RESOLVED

  const ComplaintItem({
    required this.pgName,
    required this.owner,
    required this.phone,
    required this.date,
    required this.issue,
    required this.address,
    required this.imageUrl,
    required this.isResolved,
  });
}

/// ------------ STATUS STAMP (RESOLVED / NOT RESOLVED) ------------
Widget buildComplaintStamp(bool isResolved) {
  final Color color = isResolved ? Colors.green : Colors.red;
  final String text = isResolved ? 'RESOLVED' : 'NOT RESOLVED';

  return Transform.rotate(
    angle: -0.28,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 0.5.w),
        borderRadius: BorderRadius.circular(1.w),
      ),
      child: Column(
        children: [
          Text(
            '★★★',
            style: TextStyle(
              fontSize: 10.sp,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              color: color,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    ),
  );
}

/// ------------ PAGE ------------
class UserComplaintsPage extends StatelessWidget {
  const UserComplaintsPage({super.key});

  // Dummy data
  final List<ComplaintItem> complaints = const [
    ComplaintItem(
      pgName: 'City Comfort PG',
      owner: 'Pradeep',
      phone: '9123456780',
      date: '24/11/2025',
      issue:
          'Water supply issue in mornings, and common washroom not cleaned regularly.',
      address: '3rd Cross, Marathahalli, Bangalore, 560037',
      imageUrl:
          'https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg',
      isResolved: false,
    ),
    ComplaintItem(
      pgName: 'Green Nest PG',
      owner: 'Ranjith',
      phone: '9876543210',
      date: '23/11/2025',
      issue:
          'Wi-Fi not working properly during nights, frequent disconnections.',
      address: '5th Main, Kundalahalli Gate, Bangalore, 560066',
      imageUrl:
          'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg',
      isResolved: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f4ff),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Complaints',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            /// Search
            const UserSearchBar(hintText: 'Search by PG / owner / phone...'),
            SizedBox(height: 2.h),

            /// Status filter (All / Resolved / Not Resolved)
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 55.w,
                child: FilterDropdown<String>(
                  label: 'Status',
                  value: 'All',
                  options: const ['All', 'Resolved', 'Not Resolved'],
                  displayText: (v) => v,
                  onChanged: (_) {},
                ),
              ),
            ),
            SizedBox(height: 2.h),

            /// List
            Expanded(
              child: ListView.builder(
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  final c = complaints[index];

                  return Stack(
                    children: [
                      /// Tenant card itself
                      TenantCard(
                        imageUrl: c.imageUrl,
                        name: c.pgName, // PG name as title
                        phone: c.phone,
                        // use TenantCard's dynamic rows: Name / Phone / Issue
                        reason: c.issue,
                        checkedIn: null,
                        checkedOut: null,
                        room: null,
                        sharing: null,
                        primaryActionLabel: 'Details',
                        primaryActionIcon: Icons.info_outline,
                        primaryActionColor: Colors.indigo,
                        onPrimaryActionPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ComplaintDetailsPage(
                                pgName: c.pgName,
                                address: c.address,
                                owner: c.owner,
                                phone: c.phone,
                                issue: c.issue,
                              ),
                            ),
                          );
                        },
                        onCallPressed: () {
                          // UI only (wire dialer later)
                        },
                      ),

                      /// RESOLVED / NOT RESOLVED stamp (top-right)
                      Positioned(
                        top: 1.2.h,
                        right: 4.w,
                        child: buildComplaintStamp(c.isResolved),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
