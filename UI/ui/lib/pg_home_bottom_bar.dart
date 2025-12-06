import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class PgHomeBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const PgHomeBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 2.h),
      color: const Color(0xfffdf4ff),
      child: Row(
        children: [
          _TabItem(
            label: 'PG List',
            icon: Icons.apartment,
            isSelected: selectedIndex == 0,
            onTap: () => onTabChanged(0),
          ),

          SizedBox(width: 3.w),

          _TabItem(
            label: 'Home',
            svgAsset: 'lib/assets/logo2.svg', // your home SVG
            isSelected: selectedIndex == 1,
            onTap: () => onTabChanged(1),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final IconData? icon;
  final String? svgAsset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    this.icon,
    this.svgAsset,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = Colors.teal;
    final inactiveColor = Colors.grey.shade700;

    Widget customIcon = svgAsset != null
        ? SvgPicture.asset(
            svgAsset!,
            width: 18.sp,
            height: 18.sp,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : inactiveColor,
              BlendMode.srcIn,
            ),
          )
        : Icon(
            icon,
            size: 18.sp,
            color: isSelected ? Colors.white : inactiveColor,
          );

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 5.5.h,
          decoration: BoxDecoration(
            color: isSelected ? activeColor : Colors.white,
            borderRadius: BorderRadius.circular(3.h),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customIcon,
              SizedBox(width: 1.2.w),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : inactiveColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
