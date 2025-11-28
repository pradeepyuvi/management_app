import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentTile extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;
  final String title;
  final IconData icon;

  const PaymentTile({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 9.5.w,
                  height: 9.5.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Icon(icon, size: 18.sp, color: Colors.black87),
                ),
                SizedBox(width: 3.5.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Radio<int>(
                  value: index,
                  groupValue: selectedIndex,
                  onChanged: (_) => onTap(),
                  activeColor: Colors.green,
                ),
              ],
            ),

            if (isSelected) ...[
              SizedBox(height: 1.6.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF16A34A),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Pay via $title',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
