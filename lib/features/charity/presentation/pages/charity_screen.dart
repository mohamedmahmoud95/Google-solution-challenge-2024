import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/charity/data/models/charity_model.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/pages/see_more.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/widgets/prayers_card.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import '../../../../config/routes.dart';
import '../../../../core/utils/app_images.dart';
import '../../../home/presentation/widgets/help_card.dart';
import '../../../reels_screen/presentation/widgets/video_card.dart';
import '../widgets/charity_card.dart';
import '../widgets/chirty_horizontal_card.dart';

class CharityScreen extends StatefulWidget {
  const CharityScreen({super.key});

  @override
  State<CharityScreen> createState() => _CharityScreenState();
}

class _CharityScreenState extends State<CharityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            "WeCare",
            style: TextStyle(fontWeight: FontWeight.w900),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Swiper(
              duration: 80,
              autoplay: false,
              viewportFraction: 0,
              itemBuilder: (BuildContext context, int index) {
                return HelpCard(index);
              },
              itemCount: 1,
              itemWidth: double.infinity,
              itemHeight: 300.0,
              layout: SwiperLayout.TINDER,
            ),
            SizedBox(
              height: HomeCubit.get(context).screenHeight(context) * .03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HomeCubit.get(context).screenWidth(context) * .03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Urgent Fundraising".tr(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeMoreScreen(
                                screenTitle: 'Urgent Fundraising',
                                body: CharityHorizontalCard(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See more".tr(),
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * .001,
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * 0.41,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.charityDetails,
                            arguments: CharityModel(
                              name:
                                  "Helping Earthquake Victims Earthquake victims ",
                              imageUrl: AppImages.education,
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                  'Fusce eu risus non arcu bibendum suscipit. '
                                  'Donec id pulvinar tortor. Sed vel nunc tellus. '
                                  'Duis auctor convallis magna, vel lacinia sapien efficitur at. '
                                  'In hac habitasse platea dictumst.',
                              listImagesUrl: [
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                              ],
                              fund: 5685,
                              funCollected: 4259,
                              dayLeft: 4,
                              organizationName: 'Pepars',
                            ),
                          );
                        },
                        child: CharityCard(
                          charityModel: CharityModel(
                            name:
                                "Helping Earthquake Victims Earthquake victims ",
                            imageUrl: AppImages.education,
                            description: '',
                            listImagesUrl: [
                              AppImages.education,
                              AppImages.education
                            ],
                            fund: 5685,
                            funCollected: 4259,
                            dayLeft: 4,
                            organizationName: 'Pepars',
                          ),
                        ),
                      ),
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: HomeCubit.get(context).screenHeight(context) * .03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HomeCubit.get(context).screenWidth(context) * .03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coming to an end".tr(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 25),
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeMoreScreen(
                                screenTitle: 'Coming to an end',
                                body: CharityHorizontalCard(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See more".tr(),
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * .001,
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * 0.41,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.charityDetails,
                            arguments: CharityModel(
                              name:
                                  "Helping Earthquake Victims Earthquake victims ",
                              imageUrl: AppImages.education,
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                  'Fusce eu risus non arcu bibendum suscipit. '
                                  'Donec id pulvinar tortor. Sed vel nunc tellus. '
                                  'Duis auctor convallis magna, vel lacinia sapien efficitur at. '
                                  'In hac habitasse platea dictumst.',
                              listImagesUrl: [
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                                AppImages.education,
                              ],
                              fund: 5685,
                              funCollected: 4259,
                              dayLeft: 4,
                              organizationName: 'Pepars',
                            ),
                          );
                        },
                        child: CharityCard(
                          charityModel: CharityModel(
                            name:
                                "Helping Earthquake Victims Earthquake victims ",
                            imageUrl: AppImages.education,
                            description: '',
                            listImagesUrl: [
                              AppImages.education,
                              AppImages.education
                            ],
                            fund: 5685,
                            funCollected: 4259,
                            dayLeft: 4,
                            organizationName: 'Pepars',
                          ),
                        ),
                      ),
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: HomeCubit.get(context).screenHeight(context) * .03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        HomeCubit.get(context).screenWidth(context) * .03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:
                            HomeCubit.get(context).screenWidth(context) * .75,
                        child: Text(
                          "Watch the Impact of your Donation".tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeMoreScreen(
                                screenTitle:
                                    "Watch the Impact of your Donation",
                                body: VideoCard(),
                                isVideos: true,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See more".tr(),
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .001,
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * 0.3,
                  child: const VideoCard(),
                ),
              ],
            ),
            SizedBox(
              height: HomeCubit.get(context).screenHeight(context) * .03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HomeCubit.get(context).screenWidth(context) * .03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:
                            HomeCubit.get(context).screenWidth(context) * .75,
                        child: Text(
                          "Prayers from Good People".tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 22),
                        ),
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeMoreScreen(
                                screenTitle: 'Prayers from Good People',
                                isPrayer: true,
                                body: PrayerCard(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "See more".tr(),
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * .001,
                  ),
                  SizedBox(
                    height:
                        HomeCubit.get(context).screenHeight(context) * 0.298,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const PrayerCard(),
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: HomeCubit.get(context).screenHeight(context) * .03,
            ),
          ],
        ),
      ),
    );
  }
}
