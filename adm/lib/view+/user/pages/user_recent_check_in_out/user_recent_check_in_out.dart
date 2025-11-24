import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/search_bar.dart';
import 'package:adm/view+/user/widgets/filter_dropdown.dart';
import 'package:adm/view+/user/widgets/tenant_card.dart';

class RecentTenant {
  final String imageUrl;
  final String name;
  final String phone;
  final String checkedIn;
  final String checkedOut;

  const RecentTenant({
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.checkedIn,
    required this.checkedOut,
  });
}

class RecentCheckInOutPage extends StatelessWidget {
  const RecentCheckInOutPage({super.key});

  // dummy list
  final List<RecentTenant> _tenants = const [
    RecentTenant(
      imageUrl:
          "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg",
      name: "Pradeep",
      phone: "9876543210",
      checkedIn: "23/11/2025",
      checkedOut: "24/11/2025",
    ),
    RecentTenant(
      imageUrl:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
      name: "Ranjith",
      phone: "9123456780",
      checkedIn: "22/11/2025",
      checkedOut: "23/11/2025",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // for pure UI demo just use fixed filter values
    const String statusValue = 'All';
    const String rangeValue = 'All';

    return Scaffold(
      backgroundColor: const Color(0xfff8f4ff),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "Recent Check-In / Out",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            const UserSearchBar(hintText: "Search by name or phone..."),
            SizedBox(height: 2.h),

            /// -------- FILTERS ROW --------
            Row(
              children: [
                // Type filter: All / Check-In / Check-Out
                Expanded(
                  child: FilterDropdown<String>(
                    label: "Type",
                    value: statusValue,
                    options: const ["All", "Check-In", "Check-Out"],
                    displayText: (v) => v,
                    onChanged: (_) {}, // UI only
                  ),
                ),
                SizedBox(width: 3.w),
                // Range filter: All / 30 / 60 / 90 days
                Expanded(
                  child: FilterDropdown<String>(
                    label: "Range",
                    value: rangeValue,
                    options: const ["All", "30 days", "60 days", "90 days"],
                    displayText: (v) {
                      if (v == "All") return "All";
                      return "Last $v";
                    },
                    onChanged: (_) {}, // UI only
                  ),
                ),
              ],
            ),

            SizedBox(height: 2.h),

            /// -------- LIST --------
            Expanded(
              child: ListView.builder(
                itemCount: _tenants.length,
                itemBuilder: (context, index) {
                  final t = _tenants[index];
                  return TenantCard(
                    imageUrl: t.imageUrl,
                    name: t.name,
                    phone: t.phone,
                    checkedIn: t.checkedIn,
                    checkedOut: t.checkedOut,
                    // no "reason" for this page
                    reason: null,
                    primaryActionLabel: "Block",
                    primaryActionIcon: Icons.block,
                    primaryActionColor: Colors.red.shade700,
                    onPrimaryActionPressed: () {},
                    onCallPressed: () {},
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
