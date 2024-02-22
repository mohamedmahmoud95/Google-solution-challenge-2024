import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadWidget extends StatelessWidget {
  final String text;

  const UploadWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).primaryColorLight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14.sp))),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Text(
        "Upload $text",
        style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
