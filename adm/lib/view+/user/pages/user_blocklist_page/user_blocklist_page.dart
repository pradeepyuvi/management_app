import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/tenant_card.dart';
import 'package:adm/view+/user/widgets/search_bar.dart';
import 'package:adm/view+/user/widgets/filter_dropdown.dart';
import '../user_blocklist_page/add_block_tenant_page.dart';

class BlockedTenant {
  final String imageUrl;
  final String name;
  final String phone;
  final String reason;

  const BlockedTenant({
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.reason,
  });
}

class UserBlockListPage extends StatelessWidget {
  const UserBlockListPage({super.key});

  final List<BlockedTenant> blockedTenants = const [
    BlockedTenant(
      imageUrl:
          "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg",
      name: "Pradeep",
      phone: "9876543210",
      reason: "Payment not cleared",
    ),
    BlockedTenant(
      imageUrl:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg",
      name: "Ranjith",
      phone: "9123456780",
      reason: "Repeated complaints",
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
          "Blocklist",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            /// ---- Search + Add button row ----
            Row(
              children: [
                /// Search bar (expanded)
                const Expanded(
                  child: UserSearchBar(hintText: "Search by name or phone..."),
                ),
                SizedBox(width: 3.w),

                /// '+' button
                SizedBox(
                  height: 6.h,
                  width: 6.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddBlockTenantPage(),
                        ),
                      );
                    },
                    child: Icon(Icons.add, size: 18.sp, color: Colors.white),
                  ),
                ),
              ],
            ),

            SizedBox(height: 2.h),

            /// Filter dropdown (Blocked duration)
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 55.w,
                child: FilterDropdown<String>(
                  label: 'Blocked',
                  value: 'All',
                  options: const ['All', '30 days', '60 days', '90 days'],
                  displayText: (v) {
                    if (v == 'All') return 'All';
                    return 'Recent in $v';
                  },
                  onChanged: (_) {},
                ),
              ),
            ),

            SizedBox(height: 2.h),

            /// List of blocked tenants
            Expanded(
              child: ListView.builder(
                itemCount: blockedTenants.length,
                itemBuilder: (context, index) {
                  final t = blockedTenants[index];
                  return TenantCard(
                    imageUrl: t.imageUrl,
                    name: t.name,
                    phone: t.phone,
                    reason: t.reason,
                    primaryActionLabel: "Unblock",
                    primaryActionIcon: Icons.lock_open,
                    primaryActionColor: Colors.blue.shade700,
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
