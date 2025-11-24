import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// ------------------ MODEL ------------------
class PgItem {
  final String pgName;
  final String address;
  final String ownerName;
  final String ownerMobile;
  final String ownerMail;
  final String imageUrl;
  final bool isTraffic;
  final bool isSubscribed;

  const PgItem({
    required this.pgName,
    required this.address,
    required this.ownerName,
    required this.ownerMobile,
    required this.ownerMail,
    required this.imageUrl,
    required this.isTraffic,
    required this.isSubscribed,
  });
}

/// ---------------- STAR STAMP WIDGET ----------------
Widget buildStarStamp(bool isTraffic) {
  final color = isTraffic ? Colors.red : Colors.green;

  return Transform.rotate(
    angle: -0.28,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 0.5.w),
        borderRadius: BorderRadius.circular(1.w),
      ),
      child: Column(
        children: [
          Text(
            "★★★",
            style: TextStyle(
              fontSize: 10.sp,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isTraffic ? "TRAFFIC" : "NO-TRAFFIC",
            style: TextStyle(
              fontSize: 10.sp,
              color: color,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    ),
  );
}

/// ------------------ PG CARD ------------------
class PgCard extends StatelessWidget {
  final PgItem pg;

  const PgCard({super.key, required this.pg});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// MAIN CARD
        Card(
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.w),
          ),
          margin: EdgeInsets.only(bottom: 3.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.w),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFDDF8E9), Color(0xFFC4E8F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
              child: Column(
                children: [
                  /// TOP ROW
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// IMAGE
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.w),
                        child: Image.network(
                          pg.imageUrl,
                          height: 10.h,
                          width: 10.h,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            height: 10.h,
                            width: 10.h,
                            color: Colors.grey.shade300,
                            child: Icon(Icons.home, size: 18.sp),
                          ),
                        ),
                      ),

                      SizedBox(width: 4.w),

                      /// TEXT DETAILS
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pg.pgName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 0.6.h),
                            Text(pg.address, style: TextStyle(fontSize: 13.sp)),
                            SizedBox(height: 1.h),
                            Text(
                              "Owner: ${pg.ownerName}",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              "Mobile: ${pg.ownerMobile}",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            Text(
                              "Mail: ${pg.ownerMail}",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Text("Map:", style: TextStyle(fontSize: 13.sp)),
                                SizedBox(width: 1.w),
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 15.sp,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 2.h),

                  /// BUTTONS ROW
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            /// FREE TRIAL
                            if (!pg.isSubscribed)
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFA000),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.2.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.card_giftcard, size: 15.sp),
                                      SizedBox(width: 2.w),
                                      Text(
                                        "Free Trial",
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            /// SUBSCRIBED
                            if (pg.isSubscribed)
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigo,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.2.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.verified, size: 15.sp),
                                      SizedBox(width: 2.w),
                                      Text(
                                        'Subscribed',
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            SizedBox(width: 3.w),

                            /// CALL BUTTON (always)
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade700,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.2.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.w),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.call, size: 15.sp),
                                    SizedBox(width: 2.w),
                                    Text(
                                      "Call",
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        /// STAMP
        Positioned(top: 1.h, right: 3.w, child: buildStarStamp(pg.isTraffic)),
      ],
    );
  }
}
