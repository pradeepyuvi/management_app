import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditableField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onEdit;

  const EditableField({
    super.key,
    required this.label,
    required this.value,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Use theme for consistency

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
      child: TextFormField(
        readOnly: true,
        initialValue: value,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: label.toUpperCase(),
          labelStyle: theme.textTheme.labelSmall?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 1.8.h,
            horizontal: 4.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.5,
            ),
          ),
          suffixIcon: onEdit != null
              ? InkWell(
                  onTap: onEdit,
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w, top: 1.2.h),
                    child: Text(
                      "EDIT",
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class EditableField extends StatelessWidget {
//   final String label;
//   final String value;
//   final VoidCallback onEdit;

//   const EditableField({
//     super.key,
//     required this.label,
//     required this.value,
//     required this.onEdit,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
//       child: TextFormField(
//         readOnly: true,
//         initialValue: value,
//         decoration: InputDecoration(
//           labelText: label.toUpperCase(),
//           labelStyle: TextStyle(
//             fontSize: 15.sp,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey,
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 1.8.h,
//             horizontal: 4.w,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: Colors.deepOrange, width: 1.5),
//           ),
//           suffixIcon: InkWell(
//             onTap: onEdit,
//             child: Padding(
//               padding: EdgeInsets.only(right: 4.w, top: 1.2.h),
//               child: Text(
//                 "EDIT",
//                 style: TextStyle(
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepOrange,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         style: TextStyle(
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w600,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }
