import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/filter_dropdown.dart';
import 'package:adm/view+/user/widgets/pg_card.dart';
import 'package:adm/view+/user/widgets/search_bar.dart';

import '../user_ui_page/user_ui_page.dart'; // 👈 ADD THIS

class UserPgListScreen extends StatelessWidget {
  const UserPgListScreen({super.key});

  // dummy data
  final List<PgItem> pgList = const [
    PgItem(
      pgName: 'SNS Gents PG',
      address: '3rd cross, Marathalli, Bangalore, 560037',
      ownerName: 'Pradeep',
      ownerMobile: '25125412551',
      ownerMail: 'fhg@gmail.com',
      imageUrl:
          'https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg',
      isTraffic: true,
      isSubscribed: false,
    ),
    PgItem(
      pgName: 'SNS Gents PG',
      address: '3rd cross, Marathalli, Bangalore, 560037',
      ownerName: 'Pradeep',
      ownerMobile: '25125412551',
      ownerMail: 'fhg@gmail.com',
      imageUrl:
          'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg',
      isTraffic: false,
      isSubscribed: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text('PG Details', style: TextStyle(fontSize: 15.sp)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      body: Column(
        children: [
          SizedBox(height: 2.h),

          /// 🔹 Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: UserSearchBar(hintText: "Search PG...", onChanged: (v) {}),
          ),

          SizedBox(height: 2.h),

          /// 🔹 Filters
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Wrap(
              spacing: 3.w,
              runSpacing: 2.h,
              children: [
                SizedBox(
                  width: 28.w,
                  child: FilterDropdown<String>(
                    label: 'Status',
                    value: 'All',
                    options: const [
                      'All',
                      'Subscribed',
                      'Free Trial',
                      'Not Subscribed',
                    ],
                    displayText: (v) => v,
                    onChanged: (v) {},
                  ),
                ),
                SizedBox(
                  width: 28.w,
                  child: FilterDropdown<String>(
                    label: 'Expiry',
                    value: 'All',
                    options: const ['All', '30 days', '60 days', '90 days'],
                    displayText: (v) => v,
                    onChanged: (v) {},
                  ),
                ),
                SizedBox(
                  width: 28.w,
                  child: FilterDropdown<String>(
                    label: 'Traffic',
                    value: 'All',
                    options: const ['All', 'Traffic PG', 'Non-Traffic'],
                    displayText: (v) => v,
                    onChanged: (v) {},
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 1.h),

          /// 🔹 PG Cards List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(4.w),
              itemCount: pgList.length,
              itemBuilder: (context, index) {
                final pg = pgList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const UserUiPage()),
                    );
                  },
                  child: PgCard(pg: pg),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
