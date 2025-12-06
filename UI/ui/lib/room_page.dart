import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoomInfo {
  final String roomNo;
  final int sharingType;
  final int beds;
  final bool available;

  const RoomInfo({
    required this.roomNo,
    required this.sharingType,
    required this.beds,
    this.available = true,
  });
}

const List<RoomInfo> _rooms = [
  RoomInfo(roomNo: '101', sharingType: 1, beds: 1),
  RoomInfo(roomNo: '103', sharingType: 3, beds: 3),
  RoomInfo(roomNo: '104', sharingType: 4, beds: 4),
  RoomInfo(roomNo: '201', sharingType: 2, beds: 2),
  RoomInfo(roomNo: '202', sharingType: 3, beds: 3),
];

/// COMMON SEARCH BAR
Widget _buildSearchBar() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Search room or sharing type',
      prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.symmetric(vertical: 1.4.h),
    ),
  );
}

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE0F7F3), Color(0xFFCCF1EA)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Rooms',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: Colors.teal.shade800,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              _buildSearchBar(),
              SizedBox(height: 2.h),
              Expanded(
                child: GridView.builder(
                  itemCount: _rooms.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 3.w,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final room = _rooms[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),

                        // 🔥 Updated Card Gradient (Premium Teal Glass look)
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFE4F7F2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            offset: Offset(0, 4),
                            color: Colors.black.withOpacity(0.08),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Room ${room.roomNo}',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.teal.shade900,
                                ),
                              ),
                              SizedBox(height: 0.8.h),
                              Text(
                                'Sharing Type ${room.sharingType}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.bed_outlined,
                                    size: 22,
                                    color: Colors.teal.shade700,
                                  ),
                                  SizedBox(width: 1.5.w),
                                  Text(
                                    '${room.beds}',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),

                              // 🔥 Updated "Available" Badge Gradient
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 0.7.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF00C853),
                                      Color(0xFF2ECC71),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Available',
                                  style: TextStyle(
                                    fontSize: 9.8.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
