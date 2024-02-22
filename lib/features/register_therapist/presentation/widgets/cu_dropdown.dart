import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CuDropdown extends StatelessWidget {
  final String name;
  final Widget? hint;
  final String? value;
  final List<String> items;
  final Function dropdownOnChange;

  const CuDropdown({
    required this.name,
    required this.value,
    this.hint,
    super.key,
    required this.items,
    required this.dropdownOnChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontSize: 20,
                color: AppColors.grey4,
                fontWeight: FontWeight.w600),
          ),
          Container(
            height: 40.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              menuMaxHeight: 300.h,
              value: value,
              hint: hint,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 260.w,
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.grey.shade600),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                dropdownOnChange(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
