import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      padding: EdgeInsets.only(top: 8.h, bottom: 3.h),
      width: double.infinity,
      child: Column(
        children: [
          CircleAvatar(
            radius: 7.h,
            backgroundImage: AssetImage(
              'lib/view/assets/images/person_profile_pic.jpg',
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
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Subscribed', style: TextStyle(fontSize: 15.sp)),
                SizedBox(width: 1.w),
                Icon(Icons.emoji_events, color: Colors.amber, size: 18.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
