import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
// import 'customer_booked_screen.dart';
import 'booked_screen.dart';

class PGDetailsScreen extends StatelessWidget {
  const PGDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 8.h,
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => _buildBookingPopup(context),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF80DEEA),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Text(
            'Book a PG with 500 off',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PG Image
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/pg_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Content
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title, Address, Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SNS Gents PG',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                '3rd cross, Marathahalli, Bangalore, 560037',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 1.w),
                                Text(
                                  '4.0 (102)',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Icon(Icons.favorite_border, size: 20.sp),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),

                    // Amenities
                    Text(
                      'Amenities',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _amenityItem(Icons.local_parking, 'Parking'),
                          SizedBox(width: 4.w),
                          _amenityItem(Icons.fastfood, 'Food'),
                          SizedBox(width: 4.w),
                          _amenityItem(Icons.wifi, 'Free Wi-Fi'),
                          SizedBox(width: 4.w),
                          _amenityItem(Icons.elevator, 'Lift'),
                          SizedBox(width: 4.w),
                          _amenityItem(Icons.battery_charging_full, 'Inverter'),
                          SizedBox(width: 4.w),
                          _amenityItem(Icons.hot_tub, 'Hot Water'),
                          SizedBox(width: 4.w),
                          _amenityItem(Icons.support_agent, '24/7 Service'),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h),

                    // Price Range
                    Text(
                      'Price Range',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Column(
                      children: [
                        _priceItem('1 Sharing', '₹5000'),
                        _priceItem('2 Sharing', '₹7000'),
                        _priceItem('3 Sharing', '₹9000'),
                        _priceItem('4 Sharing', '₹12000'),
                      ],
                    ),
                    SizedBox(height: 3.h),

                    // Nearby Places
                    Text(
                      'Nearby Places',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 2.h,
                      children: [
                        _nearbyItem(Icons.directions_bus, 'ks Bus stop'),
                        _nearbyItem(Icons.train, 'Bellandur Metro'),
                        _nearbyItem(Icons.shopping_bag, 'Centro Mall'),
                      ],
                    ),
                    SizedBox(height: 3.h),

                    // Gallery
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.sp),
                              child: Image.asset(
                                'lib/assets/images/pg_image.jpg',
                                width: 30.w,
                                height: 15.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'All',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 2.h,
                      children: [
                        _galleryItem('lib/assets/images/pg_image.jpg'),
                        _galleryItem('lib/assets/images/pg_image.jpg'),
                        _galleryItem('lib/assets/images/pg_image.jpg'),
                        _galleryItem('lib/assets/images/pg_image.jpg'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingPopup(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Center(
            child: Text(
              'Choose Sharing',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2.h),
          _sharingOption('1 Sharing - ₹12000'),
          _sharingOption('2 Sharing - ₹9000'),
          _sharingOption('3 Sharing - ₹7000'),
          _sharingOption('4 Sharing - ₹5000'),
          SizedBox(height: 3.h),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookedScreen()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF80DEEA),
                padding: EdgeInsets.symmetric(vertical: 2.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
              ),
              child: Text(
                'Book a PG with 500 off',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _sharingOption(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (val) {}),
          Text(label, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _amenityItem(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18.sp, color: Colors.blue.shade700),
        SizedBox(width: 2.w),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }

  Widget _priceItem(String type, String price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type, style: TextStyle(fontSize: 14.sp)),
          Text(
            price,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _nearbyItem(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18.sp, color: Colors.green),
        SizedBox(width: 2.w),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }

  Widget _galleryItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.sp),
      child: Image.asset(
        imagePath,
        width: 40.w,
        height: 20.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
