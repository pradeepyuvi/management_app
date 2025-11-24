import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'customer/pg_list_screen.dart';
import 'user/pages/user_dashboard_page/user_dashboard_page.dart';

class AdmHomePage extends StatelessWidget {
  const AdmHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.sp,
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Icon(Icons.home, size: 24.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 16.sp,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 20.sp, color: Colors.black),
                ),
                SizedBox(width: 3.w),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Customer → existing screen
                    _buildButton(
                      context,
                      label: 'Customer',
                      icon: Icons.apartment,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserPgListScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 4.h),
                    // User → new Dashboard screen
                    _buildButton(
                      context,
                      label: 'User',
                      icon: Icons.business,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserDashboardPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.sp),
      child: Container(
        width: 80.w,
        padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: Colors.blue.shade900),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
