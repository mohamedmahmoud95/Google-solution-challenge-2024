import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CuTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  const CuTextField({
    this.controller,
    required this.name,
    required this.hintText,
    super.key,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
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
          SizedBox(
            height: 40.h,
            child: TextField(
              controller: controller,
              style: TextStyle(fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
