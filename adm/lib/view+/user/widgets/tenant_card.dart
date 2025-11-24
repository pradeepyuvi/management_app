import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TenantCard extends StatelessWidget {
  final String imageUrl;

  // core data
  final String name;
  final String phone;

  // 🔹 NEW: PG room status specific
  final String? owner;
  final String? vacant;
  final String? occupied;

  // optional extra rows you can mix & match per page
  final String? checkedIn;
  final String? checkedOut;
  final String? reason;
  final String? room;
  final String? sharing;

  // primary button (Block / Unblock / PG Name / etc.)
  final String primaryActionLabel;
  final IconData primaryActionIcon;
  final Color primaryActionColor;
  final VoidCallback? onPrimaryActionPressed;

  // call button
  final VoidCallback? onCallPressed;

  const TenantCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.phone,
    // NEW
    this.owner,
    this.vacant,
    this.occupied,
    // existing
    this.checkedIn,
    this.checkedOut,
    this.reason,
    this.room,
    this.sharing,
    required this.primaryActionLabel,
    required this.primaryActionIcon,
    required this.primaryActionColor,
    this.onPrimaryActionPressed,
    this.onCallPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Build dynamic rows in order
    final List<_RowItem> rows = [
      _RowItem(label: 'Name', value: name),
      _RowItem(label: 'Phone', value: phone),

      // 🔹 NEW FIELDS (used in PG rooms status page)
      if (owner != null) _RowItem(label: 'Owner', value: owner!),
      if (vacant != null) _RowItem(label: 'Vacant', value: vacant!),
      if (occupied != null) _RowItem(label: 'Occupied', value: occupied!),

      // existing logic (still works for other pages)
      if (room != null) _RowItem(label: 'Room', value: room!),
      if (sharing != null) _RowItem(label: 'Sharing', value: sharing!),
      if (checkedIn != null) _RowItem(label: 'Checked In', value: checkedIn!),
      if (checkedOut != null)
        _RowItem(label: 'Checked Out', value: checkedOut!),
      if (reason != null && reason!.isNotEmpty)
        _RowItem(label: 'Reason', value: reason!),
    ];

    return Card(
      elevation: 7,
      margin: EdgeInsets.only(bottom: 2.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.sp)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.sp),
        child: Container(
          padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 2.h),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFDDF8E9), Color(0xFFC4E8F5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              /// ------------------- TOP ROW -------------------
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // avatar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.sp),
                    child: Image.network(
                      imageUrl,
                      height: 9.h,
                      width: 9.h,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 9.h,
                        width: 9.h,
                        color: Colors.grey.shade300,
                        child: Icon(Icons.person, size: 20.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),

                  // labels + values
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // labels
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final r in rows) ...[
                              _label(r.label),
                              SizedBox(height: 0.7.h),
                            ],
                          ],
                        ),
                        SizedBox(width: 4.w),
                        // values
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final r in rows) ...[
                                _value(r.value),
                                SizedBox(height: 0.7.h),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 2.h),

              /// ------------------- BUTTONS -------------------
              Row(
                children: [
                  // primary action
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onPrimaryActionPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryActionColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 1.6.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.sp),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(primaryActionIcon, size: 16.sp),
                          SizedBox(width: 2.w),
                          Text(
                            primaryActionLabel,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  // call
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onCallPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 1.6.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.sp),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, size: 16.sp),
                          SizedBox(width: 2.w),
                          Text(
                            "Call",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    ),
  );

  Widget _value(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    overflow: TextOverflow.ellipsis,
  );
}

class _RowItem {
  final String label;
  final String value;

  _RowItem({required this.label, required this.value});
}
