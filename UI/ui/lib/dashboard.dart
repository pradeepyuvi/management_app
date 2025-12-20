import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pgBanner(),
            _pgDetails(), // 👈 name & address below image
            // SizedBox(height: 2.h),
            _dashboardGrid(),
            // SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }

  // ---------------- PG BANNER ----------------
  Widget _pgBanner() {
    return SizedBox(
      height: 32.h, //
      width: 100.w,
      child: Image.asset('lib/assets/bldg.png', fit: BoxFit.cover),
    );
  }

  // ---------------- PG DETAILS ----------------
  Widget _pgDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SNS Gents Luxury pg',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            '3rd Cross, Marathahalli, Bengaluru – 560037',
            style: TextStyle(fontSize: 10.5.sp, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  // ---------------- DASHBOARD GRID ----------------
  Widget _dashboardGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 3.w,
        crossAxisSpacing: 3.w,
        childAspectRatio: 1.1,
        children: const [
          _DashboardCard(
            title: 'Available Beds',
            value: '8',
            color: Color(0xFFD7ECFF),
            icon: Icons.bed,
          ),
          _DashboardCard(
            title: 'Pending Payments',
            value: '0',
            color: Color(0xFFE6DDF7),
            icon: Icons.payments,
          ),
          _DashboardCard(
            title: 'Tenants Details',
            value: '0',
            color: Color(0xFFDFF3E3),
            icon: Icons.people,
          ),
          _DashboardCard(
            title: 'Recent Check In Out',
            value: '0',
            color: Color(0xFFFFE7C7),
            icon: Icons.event,
          ),
          _DashboardCard(
            title: 'Blocked Tenants',
            value: '2',
            color: Color(0xFFFFDADA),
            icon: Icons.block,
          ),
        ],
      ),
    );
  }
}

// ---------------- DASHBOARD CARD ----------------
class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(icon, color: Colors.black87),
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 0.5.h),
          Text(
            value,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
