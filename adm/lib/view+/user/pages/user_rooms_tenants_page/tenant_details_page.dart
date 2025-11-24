import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/search_bar.dart';
import 'package:adm/view+/user/widgets/tenant_card.dart';
import '../user_ui_page/user_ui_page.dart'; // 👈 ADD THIS IMPORT

class TenantDetailsItem {
  final String imageUrl;
  final String name;
  final String phone;
  final String room;
  final String sharing;
  final String pgName;

  const TenantDetailsItem({
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.room,
    required this.sharing,
    required this.pgName,
  });
}

class TenantDetailsPage extends StatelessWidget {
  const TenantDetailsPage({super.key});

  // dummy data
  final List<TenantDetailsItem> tenants = const [
    TenantDetailsItem(
      imageUrl:
          "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg",
      name: "Pradeep",
      phone: "9876543210",
      room: "101",
      sharing: "Two",
      pgName: "SNS Gents PG",
    ),
    TenantDetailsItem(
      imageUrl:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
      name: "Ranjith",
      phone: "9123456780",
      room: "203",
      sharing: "Three",
      pgName: "City Comfort PG",
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
          "Tenant Details",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            const UserSearchBar(hintText: "Search tenant by name or phone..."),
            SizedBox(height: 2.h),

            Expanded(
              child: ListView.builder(
                itemCount: tenants.length,
                itemBuilder: (context, index) {
                  final t = tenants[index];
                  return TenantCard(
                    imageUrl: t.imageUrl,
                    name: t.name,
                    phone: t.phone,
                    room: t.room,
                    sharing: t.sharing,
                    // no checkedIn/checkedOut/reason on this page
                    primaryActionLabel: t.pgName, // PG Name button
                    primaryActionIcon: Icons.home_work, // PG icon
                    primaryActionColor: Colors.indigo,
                    // onPrimaryActionPressed: () {},
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
