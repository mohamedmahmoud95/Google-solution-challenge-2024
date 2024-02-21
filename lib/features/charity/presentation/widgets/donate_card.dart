import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonateCard extends StatelessWidget {
  final int number;

  const DonateCard({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              12.sp,
            ),
          ),
        ),
      ),
      child: Center(
        child: Text(
          "\$$number",
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
