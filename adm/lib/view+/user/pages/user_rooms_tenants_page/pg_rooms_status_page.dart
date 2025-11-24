import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/search_bar.dart';
import 'package:adm/view+/user/widgets/tenant_card.dart';

import '../user_ui_page/user_ui_page.dart'; // 👈 ADD THIS IMPORT

class PgRoomsStatusItem {
  final String imageUrl;
  final String pgName;
  final String ownerName;
  final String phone;
  final String vacant;
  final String occupied;

  const PgRoomsStatusItem({
    required this.imageUrl,
    required this.pgName,
    required this.ownerName,
    required this.phone,
    required this.vacant,
    required this.occupied,
  });
}

class PgRoomsStatusPage extends StatelessWidget {
  const PgRoomsStatusPage({super.key});

  // Dummy data – UI only
  final List<PgRoomsStatusItem> pgRooms = const [
    PgRoomsStatusItem(
      imageUrl:
          "https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg",
      pgName: "SNS Gents PG",
      ownerName: "Pradeep",
      phone: "9876543210",
      vacant: "12",
      occupied: "46",
    ),
    PgRoomsStatusItem(
      imageUrl:
          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg",
      pgName: "City Comfort PG",
      ownerName: "Ranjith",
      phone: "9123456780",
      vacant: "8",
      occupied: "32",
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
          "PG Rooms Status",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            const UserSearchBar(hintText: "Search PG by name or phone..."),
            SizedBox(height: 2.h),

            /// List of PG room status cards
            Expanded(
              child: ListView.builder(
                itemCount: pgRooms.length,
                itemBuilder: (context, index) {
                  final item = pgRooms[index];

                  return TenantCard(
                    imageUrl: item.imageUrl,
                    name: item.pgName,
                    phone: item.phone,

                    /// EXTRA NEW FIELDS — ALREADY ADDED IN TENANT CARD
                    owner: item.ownerName,
                    vacant: item.vacant,
                    occupied: item.occupied,

                    /// BUTTON → NAVIGATE TO USER_UI_PAGE
                    primaryActionLabel: item.pgName,
                    primaryActionIcon: Icons.home_work,
                    primaryActionColor: Colors.indigo,
                    onPrimaryActionPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const UserUiPage()),
                      );
                    },

                    onCallPressed: () {}, // UI only
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
