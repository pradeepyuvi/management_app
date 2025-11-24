import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserPgTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  final TextInputType? keyboardType;
  final int? maxLength;

  /// NEW: optional suffix icon (pencil)
  final IconData? suffixIcon;

  const UserPgTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.maxLength,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp),

        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 2.w),
          child: Icon(icon, size: 18.sp, color: Colors.grey.shade700),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 12.w),

        /// NEW: Only show suffix icon if provided
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: Icon(
                  suffixIcon,
                  size: 16.sp,
                  color: Colors.grey.shade600,
                ),
              )
            : null,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
