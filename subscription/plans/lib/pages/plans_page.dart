import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/plans_top_bar.dart';
import '../widgets/current_plan_card.dart';
import '../widgets/plan_card.dart';
import '../widgets/plans_bottom_bar.dart';

import 'payment_page.dart';

class PlansPage extends StatelessWidget {
  PlansPage({super.key});

  /// Index Mapping:
  /// 0: Silver 6M, 1: Silver 1Y
  /// 2: Gold 6M,   3: Gold 1Y
  /// 4: Platinum 6M, 5: Platinum 1Y
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(3); // Gold 1Y

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF120B28), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedIndex,
              builder: (context, selectedIndex, _) {
                final String selectedPrice = _priceForIndex(selectedIndex);
                final String selectedDuration = _durationForIndex(
                  selectedIndex,
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PlansTopBar(),
                    SizedBox(height: 2.h),
                    const CurrentPlanCard(),
                    SizedBox(height: 3.h),

                    Text(
                      'Upgrade to get more out of your subscription',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            PlanCard(
                              title: 'Silver',
                              tag: 'Basic',
                              isHighlighted: false,
                              featureList: const [
                                'Pg Management',
                                'Rooms',
                                'Beds',
                                'Payments',
                                'Tenants tracking',
                                'Fraud prevention',
                                'Security',
                                '24x7 support',
                              ],
                              sixMonthIndex: 0,
                              oneYearIndex: 1,
                              sixMonthPrice: _priceForIndex(0),
                              oneYearPrice: _priceForIndex(1),
                              selectedIndex: selectedIndex,
                              onSelected: (i) => _selectedIndex.value = i,
                            ),
                            SizedBox(height: 2.h),

                            PlanCard(
                              title: 'Gold',
                              tag: 'Recommended',
                              isHighlighted: true,
                              featureList: const [
                                'Pg Management',
                                'Rooms',
                                'Beds',
                                'Payments tracking',
                                'Tenants tracking',
                                'Fraud prevention',
                                'KYC - 20/month',
                                'Security',
                                '24x7 support',
                              ],
                              sixMonthIndex: 2,
                              oneYearIndex: 3,
                              sixMonthPrice: _priceForIndex(2),
                              oneYearPrice: _priceForIndex(3),
                              selectedIndex: selectedIndex,
                              onSelected: (i) => _selectedIndex.value = i,
                            ),
                            SizedBox(height: 2.h),

                            PlanCard(
                              title: 'Platinum',
                              tag: 'BEST VALUE',
                              isHighlighted: false,
                              featureList: const [
                                'Pg Management',
                                'Rooms',
                                'Beds',
                                'Payments tracking',
                                'Tenants tracking',
                                'Fraud prevention',
                                'KYC - 40/month',
                                'Security',
                                '24x7 support',
                              ],
                              sixMonthIndex: 4,
                              oneYearIndex: 5,
                              sixMonthPrice: _priceForIndex(4),
                              oneYearPrice: _priceForIndex(5),
                              selectedIndex: selectedIndex,
                              onSelected: (i) => _selectedIndex.value = i,
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ),

                    PlansBottomBar(
                      price: selectedPrice,
                      duration: selectedDuration,
                      onContinue: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => PaymentPage()),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  static String _priceForIndex(int index) {
    switch (index) {
      case 0:
        return '₹999';
      case 1:
        return '₹1998';
      case 2:
        return '₹1499';
      case 3:
        return '₹2998';
      case 4:
        return '₹1999';
      case 5:
        return '₹3998';
      default:
        return '₹0';
    }
  }

  static String _durationForIndex(int index) {
    return index % 2 == 0 ? '6 Months' : '1 Year';
  }
}
