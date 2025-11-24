import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// import 'package:adm/pages/customer/customer_pg_details_screen.dart';
import 'pg_details_screen.dart';

class BookedScreen extends StatelessWidget {
  const BookedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Booked PGs', style: TextStyle(fontSize: 14.sp)),
        centerTitle: true,
        toolbarHeight: 6.h,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                ],
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PGDetailsScreen(),
                          ),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        color: Colors.grey[100],
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'lib/assets/images/pg_image.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(2.w),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'SNS Gents PG',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '3rd cross, Marathalli, Bangalore, 560037.',
                                          style: TextStyle(fontSize: 13.sp),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4.h),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 2.w,
                                              vertical: 0.5.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(1.w),
                                            ),
                                            child: Text(
                                              'Booked with ₹500 Off',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 2.w,
                              right: 2.w,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 4.w,
                                  ),
                                  SizedBox(width: 1.w),
                                  Text(
                                    '4.0 | 102 reviews',
                                    style: TextStyle(fontSize: 11.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
