import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easypg/view/widgets/profile_item.dart';
import 'package:easypg/view/widgets/profile_header.dart';

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
          const ProfileHeader(),
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
                      ProfileItem(
                        icon: Icons.nights_stay,
                        label: 'Dark Mode',
                        onTap: () {},
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),
                      ProfileItem(
                        icon: Icons.support_agent,
                        label: 'Support',
                        onTap: () {},
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),
                      ProfileItem(
                        icon: Icons.check_circle,
                        label: 'Subscription',
                        onTap: () {},
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),
                      ProfileItem(
                        icon: Icons.group_add,
                        label: 'Refer a friend',
                        onTap: () {},
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),
                      ProfileItem(
                        icon: Icons.person,
                        label: 'Account',
                        onTap: () {},
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),
                      ProfileItem(
                        icon: Icons.star_rate,
                        label: 'Rating',
                        onTap: () {},
                      ),
                      Divider(thickness: 0.1.h, height: 0.5.h),
                      ProfileItem(
                        icon: Icons.logout,
                        label: 'Logout',
                        onTap: () {},
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

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Divider(height: 0.5.h, thickness: 0.2.h, color: Colors.grey[300]),
//           Container(
//             height: 8.h,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'lib/view/assets/images/logo.png',
//                     height: 3.h,
//                     width: 3.h,
//                   ),
//                   Text(
//                     'Home',
//                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.teal,
//             padding: EdgeInsets.only(top: 8.h, bottom: 3.h),
//             width: double.infinity,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 7.h,
//                   backgroundImage: AssetImage(
//                     'lib/view/assets/images/person_profile_pic.jpg',
//                     // 'lib/view/assets/images/human_avatar.jpg',
//                   ),
//                 ),
//                 SizedBox(height: 1.5.h),
//                 Text(
//                   'Pradeep',
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'SNS PG Marathalli, Bangalore',
//                   style: TextStyle(color: Colors.white70, fontSize: 15.sp),
//                 ),
//                 SizedBox(height: 1.5.h),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10.w,
//                       vertical: 1.5.h,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text('Subscribed', style: TextStyle(fontSize: 15.sp)),
//                       SizedBox(width: 1.w),
//                       Icon(
//                         Icons.emoji_events, // Crown-like icon
//                         color: Colors.amber, // Gold color
//                         size: 18.sp,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(2.h),
//               child: Card(
//                 elevation: 14,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(2.h),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(1.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Settings',
//                         style: TextStyle(
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Divider(thickness: 0.15.h, height: 0.5.h),
//                       // Dark Mode
//                       SwitchListTile(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         dense: true,
//                         value: false,
//                         onChanged: (val) {},
//                         title: Row(
//                           children: [
//                             Icon(Icons.nights_stay, size: 20.sp),
//                             SizedBox(width: 2.w),
//                             Text(
//                               'Dark Mode',
//                               style: TextStyle(fontSize: 15.sp),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Support
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 1.5.h,
//                             horizontal: 1.w,
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.support_agent,
//                                 size: 20.sp,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 2.w),
//                               Text(
//                                 'Support',
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Subscription
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 1.5.h,
//                             horizontal: 1.w,
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.check_circle,
//                                 size: 20.sp,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 2.w),
//                               Text(
//                                 'Subscription',
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Refer a Friend
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 1.5.h,
//                             horizontal: 1.w,
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.group_add,
//                                 size: 20.sp,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 2.w),
//                               Text(
//                                 'Refer a friend',
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Account
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 1.5.h,
//                             horizontal: 1.w,
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.person,
//                                 size: 20.sp,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 2.w),
//                               Text(
//                                 'Account',
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Rating
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 1.5.h,
//                             horizontal: 1.w,
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.star_rate,
//                                 size: 20.sp,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 2.w),
//                               Text(
//                                 'Rating',
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Logout
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.symmetric(
//                             vertical: 1.5.h,
//                             horizontal: 1.w,
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.logout,
//                                 size: 20.sp,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 2.w),
//                               Text(
//                                 'Logout',
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Divider(height: 0.5.h, thickness: 0.2.h, color: Colors.grey[300]),
//           Container(
//             height: 8.h,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'lib/view/assets/images/logo.png',
//                     height: 3.h,
//                     width: 3.h,
//                   ),
//                   Text(
//                     'Home',
//                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.teal,
//             padding: EdgeInsets.only(top: 8.h, bottom: 3.h),
//             width: double.infinity,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 7.h,
//                   backgroundImage: AssetImage(
//                     'lib/view/assets/images/human_avatar.jpg',
//                   ),
//                 ),
//                 SizedBox(height: 1.5.h),
//                 Text(
//                   'Pradeep',
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'SNS PG Marathalli, Bangalore',
//                   style: TextStyle(color: Colors.white70, fontSize: 15.sp),
//                 ),
//                 SizedBox(height: 1.5.h),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Subscribed', style: TextStyle(fontSize: 15.sp)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10.w,
//                       vertical: 1.5.h,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(2.h),
//               child: Card(
//                 elevation: 14,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(2.h),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(1.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Settings',
//                         style: TextStyle(
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Divider(thickness: 0.15.h, height: 0.5.h),

//                       // Dark Mode
//                       SwitchListTile(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         dense: true,
//                         value: false,
//                         onChanged: (val) {},
//                         title: Row(
//                           children: [
//                             Icon(Icons.nights_stay, size: 20.sp),
//                             SizedBox(width: 2.w),
//                             Text(
//                               'Dark Mode',
//                               style: TextStyle(fontSize: 14.sp),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Support
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         leading: Icon(Icons.support_agent, size: 20.sp),
//                         title: Text(
//                           'Support',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Subscription
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         leading: Icon(Icons.check_circle, size: 20.sp),
//                         title: Text(
//                           'Subscription',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Refer a Friend
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         leading: Icon(Icons.group_add, size: 20.sp),
//                         title: Text(
//                           'Refer a friend',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Account
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         leading: Icon(Icons.person, size: 20.sp),
//                         title: Text(
//                           'Account',
//                           style: TextStyle(fontSize: 14.sp),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Rating
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         leading: Icon(Icons.star_rate, size: 20.sp),
//                         title: Text(
//                           'Rating',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       Divider(thickness: 0.1.h, height: 0.5.h),

//                       // Logout
//                       ListTile(
//                         dense: true,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
//                         leading: Icon(Icons.logout, size: 20.sp),
//                         title: Text(
//                           'Logout',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Divider(height: 0.5.h, thickness: 0.2.h, color: Colors.grey[300]),
//           Container(
//             height: 8.h,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'lib/view/assets/images/logo.png',
//                     height: 3.h,
//                     width: 3.h,
//                   ),
//                   Text(
//                     'Home',
//                     style: TextStyle(color: Colors.black, fontSize: 15.sp),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.teal, // Mint color
//             padding: EdgeInsets.only(top: 8.h, bottom: 3.h),
//             width: double.infinity,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 7.h,
//                   backgroundImage: AssetImage(
//                     'lib/view/assets/images/human_avatar.jpg',
//                   ),
//                 ),
//                 SizedBox(height: 1.5.h),
//                 Text(
//                   'Pradeep',
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'SNS PG Marathalli, Bangalore',
//                   style: TextStyle(color: Colors.white70, fontSize: 15.sp),
//                 ),
//                 SizedBox(height: 1.5.h),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Subscribed', style: TextStyle(fontSize: 15.sp)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10.w,
//                       vertical: 1.5.h,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(2.h),
//               child: Card(
//                 elevation: 14,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(2.h),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(1.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Settings',
//                         style: TextStyle(
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Divider(),
//                       SwitchListTile(
//                         value: false,
//                         onChanged: (val) {},
//                         title: Row(
//                           children: [
//                             Icon(Icons.nights_stay),
//                             SizedBox(width: 2.w),
//                             Text(
//                               'Dark Mode',
//                               style: TextStyle(
//                                 fontSize: 15.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.support_agent),
//                         title: Text(
//                           'Support',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.check_circle),
//                         title: Text(
//                           'Subscription',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.group_add),
//                         title: Text(
//                           'Refer a friend',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.person),
//                         title: Text(
//                           'Account',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.star_rate),
//                         title: Text(
//                           'Rating',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.logout),
//                         title: Text(
//                           'Logout',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Divider(height: 1, thickness: 1, color: Colors.grey[300]),
//           Container(
//             height: 60,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'lib/view/assets/images/logo.png',
//                     height: 24,
//                     width: 24,
//                   ),
//                   Text(
//                     'Home',
//                     style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.teal,
//             padding: EdgeInsets.only(top: 60, bottom: 20),
//             width: double.infinity,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage(
//                     'lib/view/assets/images/human_avatar.jpg',
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Pradeep',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'SNS PG Marathalli, Bangalore',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Subscribed'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(16),
//               child: Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Settings',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Divider(),
//                       SwitchListTile(
//                         value: false,
//                         onChanged: (val) {},
//                         title: Row(
//                           children: [
//                             Icon(Icons.nights_stay),
//                             SizedBox(width: 10),
//                             Text('Dark Mode'),
//                           ],
//                         ),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.support_agent),
//                         title: Text('Support'),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.check_circle),
//                         title: Text('Subscription'),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.group_add),
//                         title: Text('Refer a friend'),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.person),
//                         title: Text('Account'),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.star_rate),
//                         title: Text('Rating'),
//                       ),
//                       ListTile(
//                         leading: Icon(Icons.logout),
//                         title: Text('Logout'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
