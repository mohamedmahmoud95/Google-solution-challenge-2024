import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.sp),
          topRight: Radius.circular(22.sp),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: Column(
        children: [
          Divider(
            indent: 140.w,
            endIndent: 140.w,
            height: 30.h,
            thickness: 4,
            color: const Color(0x67b7b7b7),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(
                Radius.circular(12.sp),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            child: Row(
              children: [
                const Icon(
                  Icons.bookmark_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Saved Items",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(
                Radius.circular(12.sp),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Why you're seeing this video",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 25.h,
                  thickness: 1,
                  color: Colors.white12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.interests,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Interested",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 25.h,
                  thickness: 1,
                  color: Colors.white12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.not_interested,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Not Interested",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 25.h,
                  thickness: 1,
                  color: Colors.white12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.report_gmailerrorred,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Report",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(
                Radius.circular(12.sp),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            child: Row(
              children: [
                const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Manage suggested content",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
