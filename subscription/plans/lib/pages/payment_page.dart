import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:plans/widgets/payment_top_bar.dart';
import 'package:plans/widgets/payment_title_section.dart';
import 'package:plans/widgets/payment_tile.dart';
import 'package:plans/widgets/payment_divider.dart';
import 'package:plans/widgets/payment_bottom_button.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  /// 0: GPay, 1: PhonePe, 2: Paytm, 3: Amazon
  final ValueNotifier<int> _selectedMethod = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedMethod,
            builder: (context, selectedIndex, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PaymentTopBar(),
                  SizedBox(height: 2.h),

                  const PaymentTitleSection(),
                  SizedBox(height: 2.h),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            PaymentTile(
                              index: 0,
                              selectedIndex: selectedIndex,
                              onTap: () => _selectedMethod.value = 0,
                              title: 'Google Pay',
                              icon: Icons.account_balance_wallet,
                            ),

                            const PaymentDivider(),

                            PaymentTile(
                              index: 1,
                              selectedIndex: selectedIndex,
                              onTap: () => _selectedMethod.value = 1,
                              title: 'PhonePe UPI',
                              icon: Icons.phone_android,
                            ),

                            const PaymentDivider(),

                            PaymentTile(
                              index: 2,
                              selectedIndex: selectedIndex,
                              onTap: () => _selectedMethod.value = 2,
                              title: 'Paytm UPI',
                              icon: Icons.account_balance,
                            ),

                            const PaymentDivider(),

                            PaymentTile(
                              index: 3,
                              selectedIndex: selectedIndex,
                              onTap: () => _selectedMethod.value = 3,
                              title: 'Amazon Pay UPI',
                              icon: Icons.shopping_bag,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  PaymentBottomButton(selectedIndex: selectedIndex),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
