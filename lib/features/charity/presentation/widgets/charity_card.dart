import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/charity/data/models/charity_model.dart';

import '../../../../core/utils/app_images.dart';

class CharityCard extends StatelessWidget {
  final CharityModel charityModel;

  const CharityCard({required this.charityModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.sp),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Container(
        width: 300.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                  ),
                  child: Image.asset(
                    AppImages.education,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.6.h,
                      ),
                      child: const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10.h,
                right: 10.w,
                left: 10.w,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 275.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 235.w,
                                  child: Text(
                                    charityModel.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.5.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xf51c1c1c),
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        width: 40.w,
                                        height: 36.h,
                                        child: CircularProgressIndicator(
                                          value: charityModel.funCollected /
                                              charityModel.fund,
                                          color: Colors.green,
                                          backgroundColor: AppColors.grey2,
                                        ),
                                      ),
                                      Text(
                                        "${((charityModel.funCollected / charityModel.fund) * 100).toStringAsFixed(0)}%",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${charityModel.funCollected}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                " Fund Collected | ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black45,
                                ),
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${charityModel.dayLeft}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    " days left",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black45,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
