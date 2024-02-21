import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_images.dart';
import '../../../home/presentation/widgets/post_card.dart';

class PrayerCard extends StatelessWidget {
  const PrayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.sp),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Container(
        width: 300.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.sp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 12.h),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.mentalHealth),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eman Pe-pars',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17.sp),
                      ),
                      Text(
                        "10 second",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              indent: 15.w,
              endIndent: 15.w,
              height: 20.h,
              color: const Color(0x67b7b7b7),
            ),
            SizedBox(
              height: 70.h,
              width: 300.w,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Center(
                  child: Text(
                    "Hopefully Audrey can get surgery soon, recover from her illness, and play with her friends..",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      overflow: TextOverflow.ellipsis,
                      color: const Color(0xf51c1c1c),
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Text(
                "You and 48 others sent this prayer",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black26,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              indent: 15.w,
              endIndent: 15.w,
              height: 1.h,
              color: const Color(0x67b7b7b7),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 10.w,
                left: 12.w,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                      Text(
                        "Aamiin",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Row(
                    children: [
                      const SharePostWidget(numOfShares: 0),
                      Text(
                        "Share",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
