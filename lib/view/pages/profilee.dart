import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 0.5.h, thickness: 0.2.h, color: Colors.grey[300]),
          SizedBox(
            height: 8.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/view/assets/images/logo.png',
                    height: 3.h,
                    width: 3.h,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal,
            padding: EdgeInsets.only(top: 8.h, bottom: 3.h),
            width: double.infinity,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 7.h,
                  backgroundImage: AssetImage(
                    'lib/view/assets/images/human_avatar.jpg',
                  ),
                ),
                SizedBox(height: 1.5.h),
                Text(
                  'Pradeep',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'SNS PG Marathalli, Bangalore',
                  style: TextStyle(color: Colors.white70, fontSize: 15.sp),
                ),
                SizedBox(height: 1.5.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 1.5.h,
                    ),
                  ),
                  child: Text('Subscribed', style: TextStyle(fontSize: 15.sp)),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(2.h),
              child: Card(
                elevation: 14,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.h),
                ),
                child: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(thickness: 0.15.h, height: 0.5.h),

                      // Dark Mode
                      SwitchListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
                        dense: true,
                        value: false,
                        onChanged: (val) {},
                        title: Row(
                          children: [
                            Icon(Icons.nights_stay, size: 20.sp),
                            SizedBox(width: 2.w),
                            Text(
                              'Dark Mode',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),

                      // Support Button
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.support_agent,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Support',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                            horizontal: 1.w,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),

                      // Subscription Button
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.check_circle,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Subscription',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                            horizontal: 1.w,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),

                      // Refer a Friend Button
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.group_add,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Refer a friend',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                            horizontal: 1.w,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),

                      // Account Button
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                            horizontal: 1.w,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),

                      // Rating Button
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_rate,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                            horizontal: 1.w,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),

                      // Logout Button
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.logout,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.5.h,
                            horizontal: 1.w,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
