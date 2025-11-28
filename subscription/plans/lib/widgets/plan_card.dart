import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'feature_icon_text.dart';
import 'duration_tile.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String tag;
  final bool isHighlighted;
  final List<String> featureList;
  final int sixMonthIndex;
  final int oneYearIndex;
  final String sixMonthPrice;
  final String oneYearPrice;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const PlanCard({
    super.key,
    required this.title,
    required this.tag,
    required this.isHighlighted,
    required this.featureList,
    required this.sixMonthIndex,
    required this.oneYearIndex,
    required this.sixMonthPrice,
    required this.oneYearPrice,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainColor = isHighlighted
        ? const Color(0xFFFFC857)
        : const Color(0xFF4E46DC);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 2.2.h, horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.sp),
        border: Border.all(color: mainColor.withOpacity(0.7), width: 1.3),
        gradient: LinearGradient(
          colors: isHighlighted
              ? [const Color(0xFF3A2500), const Color(0xFF000000)]
              : [const Color(0xFF111827), const Color(0xFF020617)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.5.w,
                  vertical: 0.7.h,
                ),
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: mainColor, width: 0.9),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.6.h),

          /// Features
          Wrap(
            spacing: 5.w,
            runSpacing: 1.5.h,
            children: featureList
                .map((f) => FeatureIconText(icon: _getIcon(f), text: f))
                .toList(),
          ),

          SizedBox(height: 2.h),

          /// Duration Selection
          Row(
            children: [
              Expanded(
                child: DurationTile(
                  labelTop: "6 Months",
                  price: sixMonthPrice,
                  selected: selectedIndex == sixMonthIndex,
                  onTap: () => onSelected(sixMonthIndex),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: DurationTile(
                  labelTop: "1 Year",
                  price: oneYearPrice,
                  selected: selectedIndex == oneYearIndex,
                  onTap: () => onSelected(oneYearIndex),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String feature) {
    if (feature.startsWith('Pg')) return Icons.dashboard_customize;
    if (feature.startsWith('Rooms')) return Icons.meeting_room;
    if (feature.startsWith('Beds')) return Icons.bed;
    if (feature.startsWith('Payments')) return Icons.payments;
    if (feature.startsWith('Tenants')) return Icons.group;
    if (feature.startsWith('Fraud')) return Icons.verified_user;
    if (feature.startsWith('KYC')) return Icons.badge;
    if (feature.startsWith('Security')) return Icons.security;
    if (feature.startsWith('24x7')) return Icons.support_agent;
    return Icons.check;
  }
}
