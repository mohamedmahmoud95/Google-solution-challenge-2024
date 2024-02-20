import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPaymentMethodTile extends StatelessWidget {
  final String title;
  final String value;

  final String groupValue;

  final void Function(String?) onChanged;
  final String image;

  const BuildPaymentMethodTile(
      {super.key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: RadioListTile<String>(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0.sp),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
            ),
          ),
          value: value,
          activeColor: Colors.green,
          groupValue: groupValue,
          onChanged: onChanged,
          secondary: SizedBox(
            height: 40.h,
            width: 45.w,
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
