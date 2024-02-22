import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/config/routes.dart';
import 'package:google_solution_challenge_2024/features/charity/data/models/charity_model.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/manager/cubit.dart';

class CharityDetailsScreen extends StatelessWidget {
  final CharityModel charityModel;

  const CharityDetailsScreen({required this.charityModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60.h,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.sp),
                    topRight: Radius.circular(24.sp),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Center(
                  child: Divider(
                    thickness: 3.sp,
                    color: Colors.white60,
                    indent: 120.w,
                    endIndent: 120.w,
                  ),
                ),
              ),
            ),
            expandedHeight: 240.h,
            elevation: 0,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                charityModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black87,
              padding: EdgeInsets.only(
                right: 18.w,
                left: 18.w,
                bottom: 18.h,
                top: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                                width: HomeCubit.get(context)
                                        .screenWidth(context) -
                                    40.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 255.w,
                                      child: Text(
                                        charityModel.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: 44.w,
                                          height: 40.h,
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
                                            fontSize: 14.sp,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$${charityModel.funCollected}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    " Fund Collected from \$${charityModel.fund} ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white70,
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
                  Divider(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outlined,
                            color: Colors.white60,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            "By",
                            style: TextStyle(
                              fontSize: 16.sp,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              charityModel.organizationName,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.green,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          width: 10.w,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: Colors.white60,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "${charityModel.dayLeft} days left",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white70,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    height: 24.h,
                  ),
                  charityModel.listImagesUrl.isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: 80.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.sp)),
                                  child: Image(
                                    image: AssetImage(
                                      charityModel.listImagesUrl[index],
                                    ),
                                    fit: BoxFit.fill,
                                    width: 100.5.w,
                                  ),
                                ),
                                itemCount: charityModel.listImagesUrl.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(width: 10.w),
                              ),
                            ),
                            Divider(
                              height: 24.h,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ReadMoreText(
                    charityModel.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    lessStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                  Divider(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.sp),
                          ),
                        ),
                        padding: EdgeInsets.all(10.sp),
                        child: Icon(
                          Icons.verified_user_sharp,
                          size: 30.sp,
                          color: Colors.white60,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "The Winchesters",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17.sp,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            "Verified foundation",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0.sp),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.donateScreen);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 10.w),
                        child: Text(
                          "Donate Now",
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
