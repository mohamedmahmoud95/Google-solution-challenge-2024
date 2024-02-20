import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../data/models/charity_model.dart';

class CharityHorizontalCard extends StatelessWidget {
  final CharityModel charityModel;

  const CharityHorizontalCard({required this.charityModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.sp),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Image(
                image: AssetImage(charityModel.imageUrl),
                width: 120.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180.w,
                  child: Text(
                    charityModel.name,
                    //"Helping Earthquake Victims Earthquake victims ",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14.sp,
                      overflow: TextOverflow.ellipsis,
                      color: const Color(0xf51c1c1c),
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${charityModel.dayLeft}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          " Days Left | ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black45,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Text(
                      "800 ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Good People",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black45,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 140.w,
                      height: 8.h,
                      child: LinearProgressIndicator(
                        value: charityModel.funCollected / charityModel.fund,
                        color: Colors.green,
                        backgroundColor: AppColors.grey2,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "${((charityModel.funCollected / charityModel.fund) * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
