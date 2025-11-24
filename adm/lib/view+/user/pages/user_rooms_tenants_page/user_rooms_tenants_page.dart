import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// your real pages
import 'package:adm/view+/user/pages/user_rooms_tenants_page/pg_rooms_status_page.dart';
import 'package:adm/view+/user/pages/user_rooms_tenants_page/tenant_details_page.dart';

class UserRoomsTenantsPage extends StatelessWidget {
  const UserRoomsTenantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1FF),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Rooms / Tenants',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),

      /// ---------------- BODY (TOP ALIGNED) ----------------
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ================= TOP STRIP =================
                  SizedBox(
                    height: 12.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // LEFT ICON BLOCK
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFE91E63),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.w),
                                bottomLeft: Radius.circular(5.w),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFC107),
                                      Color(0xFFFFA000),
                                    ],
                                  ),
                                ),
                                child: Icon(
                                  Icons.meeting_room_rounded,
                                  size: 22.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // MIDDLE → ROOMS
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PgRoomsStatusPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF2E7D32),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Rooms',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 0.6.h),
                                    Text(
                                      '258',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // RIGHT → TENANTS
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const TenantDetailsPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF1976D2),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.w),
                                  bottomRight: Radius.circular(5.w),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Tenants',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 0.6.h),
                                    Text(
                                      '856',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
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
                  ),

                  SizedBox(height: 3.h),

                  // ================= BOTTOM BUTTONS =================
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 5.5.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB59139),
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: Center(
                            child: Text(
                              'Beds Occupied - 586',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Container(
                          height: 5.5.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB59139),
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: Center(
                            child: Text(
                              'Beds Vacant - 586',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
