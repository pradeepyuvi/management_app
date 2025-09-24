import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/home_box_button.dart';
import '../home/pg_header.dart';
import '../Blocklist/blocklist_page.dart';
import '../customerdetails/customer_details_page.dart';
import '../check/recent_check_page.dart';
import '../payment/payments_page.dart';
import '../pg/pg_owner_details_page.dart';
import '../pg/available_rooms_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Stream<int> getTotalBedsStream() {
    return FirebaseFirestore.instance
        .collection('availableRooms')
        .snapshots()
        .map((snapshot) {
          int totalBeds = 0;
          for (var doc in snapshot.docs) {
            final data = doc.data();
            final beds = int.tryParse(data['bedcount'].toString()) ?? 0;
            totalBeds += beds;
          }
          return totalBeds;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: 0.1.h,
        elevation: 0,
      ),
      body: Column(
        children: [
          const PGHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: StreamBuilder<int>(
                stream: getTotalBedsStream(),
                builder: (context, bedSnapshot) {
                  final bedsCount = bedSnapshot.data?.toString() ?? '0';
                  return StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('stats')
                        .doc('counts')
                        .snapshots(),
                    builder: (context, snapshot) {
                      String blocklistCount = '0';
                      String customerCount = '0';
                      String unpaidCustomerCount = '0';

                      if (snapshot.hasData && snapshot.data!.exists) {
                        final data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        blocklistCount = (data['blocklistCount'] ?? 0)
                            .toString();
                        customerCount = (data['customerCount'] ?? 0).toString();
                        unpaidCustomerCount = (data['unpaidCustomerCount'] ?? 0)
                            .toString();
                      }

                      final boxItems = [
                        {
                          'title': 'Available Beds',
                          'subtitle': bedsCount,
                          'icon': Icons.people,
                          'iconColor': Colors.orange,
                          'backgroundColor': Colors.orange.shade100,
                        },
                        {
                          'title': 'Payments Pending',
                          'subtitle': unpaidCustomerCount,
                          'icon': Icons.currency_rupee,
                          'iconColor': Colors.green,
                          'backgroundColor': Colors.green.shade100,
                        },
                        {
                          'title': 'Blocked Customers',
                          'subtitle': blocklistCount,
                          'icon': Icons.block,
                          'iconColor': Colors.red,
                          'backgroundColor': Colors.red.shade100,
                        },
                        {
                          'title': 'Customer Details',
                          'subtitle': customerCount,
                          'icon': Icons.person,
                          'iconColor': Colors.blue,
                          'backgroundColor': Colors.blue.shade100,
                        },
                        {
                          'title': 'Analytics',
                          'subtitle': null,
                          'icon': Icons.bar_chart,
                          'iconColor': Colors.purple,
                          'backgroundColor': Colors.purple.shade100,
                        },
                        {
                          'title': 'Interested Customers',
                          'subtitle': '06',
                          'icon': Icons.favorite,
                          'iconColor': Colors.deepOrange,
                          'backgroundColor': Colors.deepOrange.shade100,
                        },
                        {
                          'title': 'Recent Check-in/out',
                          'subtitle': null,
                          'icon': Icons.calendar_today,
                          'iconColor': Colors.indigo,
                          'backgroundColor': Colors.indigo.shade100,
                        },
                        {
                          'title': 'Add PG & Room',
                          'subtitle': null,
                          'icon': Icons.house,
                          'iconColor': const Color.fromARGB(255, 43, 140, 116),
                          'backgroundColor': const Color.fromARGB(
                            255,
                            168,
                            206,
                            196,
                          ),
                        },
                      ];

                      return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 4.w,
                        mainAxisSpacing: 2.h,
                        children: boxItems.map((item) {
                          return HomeBoxButton(
                            icon: item['icon'] as IconData,
                            title: item['title'] as String,
                            subtitle: item['subtitle'] as String?,
                            iconColor: item['iconColor'] as Color,
                            backgroundColor: item['backgroundColor'] as Color,
                            onTap: () {
                              if (item['title'] == 'Blocked Customers') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BlocklistPage(),
                                  ),
                                );
                              } else if (item['title'] == 'Customer Details') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerDetailsPage(),
                                  ),
                                );
                              } else if (item['title'] ==
                                  'Recent Check-in/out') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RecentCheckPage(),
                                  ),
                                );
                              } else if (item['title'] == 'Payments Pending') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentsPage(),
                                  ),
                                );
                              } else if (item['title'] == 'Add PG & Room') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PgOwnerDetailsPage(),
                                  ),
                                );
                              } else if (item['title'] == 'Available Beds') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AvailableRoomsPage(),
                                  ),
                                );
                              } else {
                                print('${item['title']} tapped');
                              }
                            },
                          );
                        }).toList(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15.sp,
        unselectedFontSize: 15.sp,
        elevation: 10,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
