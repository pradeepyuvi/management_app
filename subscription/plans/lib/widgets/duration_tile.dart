import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DurationTile extends StatelessWidget {
  final String labelTop;
  final String price;
  final bool selected;
  final VoidCallback onTap;

  const DurationTile({
    super.key,
    required this.labelTop,
    required this.price,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: selected ? Colors.white : Colors.white.withOpacity(0.3),
            width: selected ? 1.4 : 0.9,
          ),
          color: selected
              ? Colors.white.withOpacity(0.08)
              : Colors.black.withOpacity(0.35),
        ),
        child: Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: selected,
              onChanged: (_) => onTap(),
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            SizedBox(width: 1.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelTop,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 0.3.h),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
