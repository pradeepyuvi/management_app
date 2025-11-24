import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:adm/view+/user/pages/user_add_pg_page/user_add_pg_page.dart';
import 'package:adm/view+/user/pages/user_approve_pg_list_page/user_approve_pg_list_page.dart';
import 'package:adm/view+/user/pages/user_pg_list_page/user_pg_list_page.dart';
import 'package:adm/view+/user/pages/user_blocklist_page/user_blocklist_page.dart';
import 'package:adm/view+/user/pages/user_recent_check_in_out/user_recent_check_in_out.dart';
import 'package:adm/view+/user/pages/user_rooms_tenants_page/user_rooms_tenants_page.dart';
import 'package:adm/view+/user/pages/user_complaints_page/user_complaints_page.dart';
import 'package:adm/view+/user/pages/user_activites_page/user_activites_page.dart';

class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Dashboard',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            /// ----- FULL WIDTH: PG / SUBS / DUES -----
            _PgStatsCard(
              pgsCount: '25',
              subscribedCount: '23',
              freeTrialCount: '27',
              duesCount: '37',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserPgListScreen(),
                  ),
                );
              },
            ),

            SizedBox(height: 2.h),

            /// ----- REST: 2 COLUMN GRID -----
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.5.h,
                crossAxisSpacing: 3.w,
                childAspectRatio: 1.25,
                children: [
                  // Add Page
                  _DashboardCard(
                    title: 'Add Page',
                    countText: '23',
                    icon: Icons.add_box_outlined,
                    bgColor: const Color(0xFFB3E5FC),
                    iconBgColor: const Color(0xFF81D4FA),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserAddPgPage(),
                        ),
                      );
                    },
                  ),

                  // Approve PG
                  _DashboardCard(
                    title: 'Approve PG',
                    countText: '24',
                    icon: Icons.verified_outlined,
                    bgColor: const Color(0xFFD1C4E9),
                    iconBgColor: const Color(0xFFB39DDB),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserApprovePgListPage(),
                        ),
                      );
                    },
                  ),

                  _DashboardCard(
                    title: 'Blocklist',
                    countText: '34',
                    icon: Icons.block,
                    bgColor: Color(0xFFFFCDD2),
                    iconBgColor: Color(0xFFEF9A9A),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserBlockListPage(),
                        ),
                      );
                    },
                  ),
                  _DashboardCard(
                    title: 'User Activities',
                    countText: '12234',
                    icon: Icons.person_outline,
                    bgColor: Color(0xFFE1F5FE),
                    iconBgColor: Color(0xFF90CAF9),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActivitiesPage(),
                        ),
                      );
                    },
                  ),
                  _DashboardCard(
                    title: 'Complaints',
                    countText: '443',
                    icon: Icons.report_problem_outlined,
                    bgColor: Color(0xFFFFE0B2),
                    iconBgColor: Color(0xFFFFCC80),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserComplaintsPage(),
                        ),
                      );
                    },
                  ),
                  _DashboardCard(
                    title: 'Rooms / Tenants',
                    countText: '20000 / 65634',
                    icon: Icons.meeting_room_outlined,
                    bgColor: Color(0xFFF0F4C3),
                    iconBgColor: Color(0xFFE6EE9C),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserRoomsTenantsPage(),
                        ),
                      );
                    },
                  ),
                  _DashboardCard(
                    title: 'Recent Check-In / Out',
                    countText: '65256 / 54856',
                    icon: Icons.swap_horiz,
                    bgColor: Color(0xFFFFF3E0),
                    iconBgColor: Color(0xFFFFE0B2),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecentCheckInOutPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------- GENERIC DASHBOARD CARD ----------
class _DashboardCard extends StatelessWidget {
  final String title;
  final String countText;
  final IconData icon;
  final Color bgColor;
  final Color iconBgColor;
  final VoidCallback? onTap;

  const _DashboardCard({
    required this.title,
    required this.countText,
    required this.icon,
    required this.bgColor,
    required this.iconBgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.sp),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top: title + icon
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(1.8.w),
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 18.sp, color: Colors.black87),
                ),
              ],
            ),

            SizedBox(height: 1.3.h),

            /// Count center
            Center(
              child: Text(
                countText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 0.8.h),

            /// Arrow bottom-right
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.arrow_forward,
                size: 18.sp,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------- FULL-WIDTH PG / SUBS / DUES CARD ----------
class _PgStatsCard extends StatelessWidget {
  final String pgsCount;
  final String subscribedCount;
  final String freeTrialCount;
  final String duesCount;
  final VoidCallback? onTap;

  const _PgStatsCard({
    required this.pgsCount,
    required this.subscribedCount,
    required this.freeTrialCount,
    required this.duesCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.sp),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: const Color(0xFFE3FFFB),
          borderRadius: BorderRadius.circular(14.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + icon
            Row(
              children: [
                Expanded(
                  child: Text(
                    'PG Status',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2.2.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB2EBF2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home_work_outlined,
                    size: 20.sp,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            SizedBox(height: 1.5.h),

            /// Stats rows
            _StatRow(label: 'PGs', value: pgsCount),
            SizedBox(height: 0.8.h),
            _StatRow(label: 'Subscribed', value: subscribedCount),
            SizedBox(height: 0.8.h),
            _StatRow(label: 'Free Trial', value: freeTrialCount),
            SizedBox(height: 0.8.h),
            _StatRow(label: 'Dues', value: duesCount),

            SizedBox(height: 1.5.h),

            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.arrow_forward,
                size: 20.sp,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
