import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';

import '../../../../config/routes.dart';

class HelpCard extends StatelessWidget {
  final int index;
  final Widget? buttonChild;

  const HelpCard({required this.index, this.buttonChild, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        // Navigator.pushNamed(context, Routes.articlesDetails);
      },
      child: Card(
        elevation: 0,
        color: Colors.grey.shade200,
        //AppColors.oliveGreen2.withOpacity(0.8),//Theme.of(context).cardColor,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.sp),
            borderSide: const BorderSide(color: Colors.transparent)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.oliveGreen1,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.sp),
                    topRight: Radius.circular(19.sp)),
                child: Image.asset(
                  AppImages.education,
                  height: 150.h,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Education",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "don't worry my brother ",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0.sp),
                        ),
                      ),
                      onPressed: () {
                        buttonChild == null
                            ? null
                            : Navigator.pushNamed(context, Routes.charity);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 8.h),
                        child: buttonChild ??
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
