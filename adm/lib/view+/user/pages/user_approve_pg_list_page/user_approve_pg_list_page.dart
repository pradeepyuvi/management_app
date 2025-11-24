import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:adm/view+/user/widgets/search_bar.dart'; // 👈 ADD THIS
import '../user_approve_add_pg_page/user_approve_add_pg_page.dart';

enum PgListMode { add, approve, count }

class UserApprovePgListPage extends StatelessWidget {
  final PgListMode mode;

  const UserApprovePgListPage({
    super.key,
    this.mode = PgListMode.count, // default for PG Count
  });

  // 🔹 Dummy data – UI only
  final List<Map<String, String>> pgList = const [
    {
      'name': 'Skyline Gents PG',
      'address': 'Marathahalli, Bengaluru, Karnataka, India',
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Comfort Stay Ladies PG',
      'address': 'HSR Layout, Bengaluru, Karnataka, India',
      'imageUrl': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    String title = 'PG List';
    if (mode == PgListMode.add) {
      title = 'Select PG to Add Details';
    } else if (mode == PgListMode.approve) {
      title = 'Select PG to Approve';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // 🔍 SEARCH BAR
          Padding(
            padding: EdgeInsets.all(4.w),
            child: const UserSearchBar(hintText: "Search PG..."),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
              itemCount: pgList.length,
              itemBuilder: (context, index) {
                final pg = pgList[index];

                final card = _PgCard(
                  name: pg['name'] ?? '',
                  address: pg['address'] ?? '',
                  imageUrl: pg['imageUrl'] ?? '',
                );

                // 🔹 Only Skyline Gents PG is clickable → goes to Approve PG page
                if ((pg['name'] ?? '') == 'Skyline Gents PG') {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UserApproveAddPgPage(),
                        ),
                      );
                    },
                    child: card,
                  );
                }

                // 🔹 All other PGs are view-only
                return card;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PgCard extends StatelessWidget {
  final String name;
  final String address;
  final String imageUrl;

  const _PgCard({
    required this.name,
    required this.address,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(.8.h),
      child: Container(
        padding: EdgeInsets.all(.8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                height: 8.h,
                width: 8.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 8.h,
                    width: 8.h,
                    color: Colors.grey.shade300,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.home,
                      size: 20.sp,
                      color: Colors.grey.shade700,
                    ),
                  );
                },
              ),
            ),

            SizedBox(width: 2.w),

            // 🔹 Name + Address
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 1.2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 14.sp,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 1.w),
                        Expanded(
                          child: Text(
                            address,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
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
}
