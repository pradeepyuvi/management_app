import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../user_approve_add_room_page/user_approve_add_room_page.dart';
import 'package:adm/view+/user/widgets/user_pg_text_field.dart';

class UserApproveAddPgPage extends StatelessWidget {
  const UserApproveAddPgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Approve PG',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- OWNER DETAILS CARD ----------------
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.grey.shade100,
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.group,
                          size: 22.sp,
                          color: Colors.teal.shade800,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Owner Details",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 3.h,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 1.h),

                    // Owner Name (editable)
                    UserPgTextField(
                      hintText: "Owner Name",
                      icon: Icons.person,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // Phone No (editable)
                    UserPgTextField(
                      hintText: "Phone No",
                      icon: Icons.phone,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // Email (editable)
                    UserPgTextField(
                      hintText: "Email",
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.edit,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 2.h),

            // ---------------- PG DETAILS CARD ----------------
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.grey.shade100,
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.home_work_rounded,
                          size: 22.sp,
                          color: Colors.teal.shade800,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "PG Details",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 3.h,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 1.h),

                    // PG Name
                    UserPgTextField(
                      hintText: "PG Name",
                      icon: Icons.home_rounded,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // Street
                    UserPgTextField(
                      hintText: "Street",
                      icon: Icons.alt_route_rounded,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // Area
                    UserPgTextField(
                      hintText: "Area",
                      icon: Icons.map_rounded,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // Pincode
                    UserPgTextField(
                      hintText: "Pincode",
                      icon: Icons.local_post_office_rounded,
                      keyboardType: TextInputType.number,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // City
                    UserPgTextField(
                      hintText: "City",
                      icon: Icons.location_city_rounded,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // State
                    UserPgTextField(
                      hintText: "State",
                      icon: Icons.location_on_rounded,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    UserPgTextField(
                      hintText: "Location",
                      icon: Icons.location_on_rounded,
                      suffixIcon: Icons.edit,
                    ),
                    SizedBox(height: 1.5.h),

                    // Image Upload UI + edit icon
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 3.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 20.sp,
                                color: Colors.grey.shade700,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                'PG Images',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.edit, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 3.h),

            // ---------------- BUTTONS ROW ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: SizedBox(
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UserApproveAddRoomsPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
