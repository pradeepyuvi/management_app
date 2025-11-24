import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FilterDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> options;
  final String Function(T) displayText;
  final ValueChanged<T?> onChanged;

  const FilterDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.displayText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Label
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp, // slightly reduced
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 0.5.h), // reduced spacing
        /// 🔹 Smaller dropdown
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 0.1.h, // reduced height here
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade400, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              isDense: true,
              icon: Icon(Icons.keyboard_arrow_down, size: 14.sp),

              items: options
                  .map(
                    (opt) => DropdownMenuItem<T>(
                      value: opt,
                      child: Text(
                        displayText(opt),
                        style: TextStyle(
                          fontSize: 15.5.sp, // reduced menu text
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),

              selectedItemBuilder: (_) {
                return options.map((opt) {
                  return Text(
                    displayText(opt),
                    style: TextStyle(
                      fontSize: 15.5.sp, // slightly smaller
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }).toList();
              },

              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
