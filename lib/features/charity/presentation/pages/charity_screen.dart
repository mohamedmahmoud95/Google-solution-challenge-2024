import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/widgets/prayers_card.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import '../../../home/presentation/widgets/help_card.dart';
import '../../../reels_screen/presentation/pages/video_screen.dart';
import '../widgets/charity_card.dart';

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
              autoplay: true,
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
                        onTap: () {},
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
                    height: HomeCubit.get(context).screenHeight(context) * 0.44,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const CharityCard(),
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
                        onTap: () {},
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
                    height: HomeCubit.get(context).screenHeight(context) * 0.44,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const CharityCard(),
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
                        onTap: () {},
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
                        onTap: () {},
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
      // CustomScrollView(
      //   slivers: [
      //     const SliverAppBar(
      //       floating: true,
      //       snap: true,
      //       //غيره من هنا
      //       pinned: true,
      //       elevation: 0,
      //       backgroundColor: Colors.white,
      //       title: SizedBox(
      //         width: double.infinity,
      //         child: Text(
      //           "WeCare",
      //           style: TextStyle(fontWeight: FontWeight.w900),
      //           textAlign: TextAlign.start,
      //         ),
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Swiper(
      //             duration: 80,
      //             autoplay: true,
      //             viewportFraction: 0,
      //             itemBuilder: (BuildContext context, int index) {
      //               return HelpCard(index);
      //             },
      //             itemCount: 1,
      //             itemWidth: double.infinity,
      //             itemHeight: 300.0,
      //             layout: SwiperLayout.TINDER,
      //           ),
      //           SizedBox(
      //             height: HomeCubit.get(context).screenHeight(context) * .03,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //               horizontal:
      //                   HomeCubit.get(context).screenWidth(context) * .03,
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       "Urgent Fundraising".tr(),
      //                       style: const TextStyle(
      //                         fontWeight: FontWeight.w900,
      //                         fontSize: 25,
      //                       ),
      //                     ),
      //                     InkWell(
      //                       hoverColor: Colors.transparent,
      //                       highlightColor: Colors.transparent,
      //                       splashColor: Colors.transparent,
      //                       onTap: () {},
      //                       child: Text(
      //                         "See more".tr(),
      //                         style: const TextStyle(
      //                             color: Colors.green,
      //                             fontSize: 14,
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height:
      //                       HomeCubit.get(context).screenHeight(context) * .001,
      //                 ),
      //                 SizedBox(
      //                   height:
      //                       HomeCubit.get(context).screenHeight(context) * 0.44,
      //                   child: ListView.builder(
      //                     shrinkWrap: true,
      //                     scrollDirection: Axis.horizontal,
      //                     itemBuilder: (context, index) => const CharityCard(),
      //                     itemCount: 4,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: HomeCubit.get(context).screenHeight(context) * .03,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //               horizontal:
      //                   HomeCubit.get(context).screenWidth(context) * .03,
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       "Coming to an end".tr(),
      //                       style: const TextStyle(
      //                           fontWeight: FontWeight.w900, fontSize: 25),
      //                     ),
      //                     InkWell(
      //                       hoverColor: Colors.transparent,
      //                       highlightColor: Colors.transparent,
      //                       splashColor: Colors.transparent,
      //                       onTap: () {},
      //                       child: Text(
      //                         "See more".tr(),
      //                         style: const TextStyle(
      //                             color: Colors.green,
      //                             fontSize: 14,
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height:
      //                       HomeCubit.get(context).screenHeight(context) * .001,
      //                 ),
      //                 SizedBox(
      //                   height:
      //                       HomeCubit.get(context).screenHeight(context) * 0.44,
      //                   child: ListView.builder(
      //                     shrinkWrap: true,
      //                     scrollDirection: Axis.horizontal,
      //                     itemBuilder: (context, index) => const CharityCard(),
      //                     itemCount: 4,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: HomeCubit.get(context).screenHeight(context) * .03,
      //           ),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Padding(
      //                 padding: EdgeInsets.symmetric(
      //                   horizontal:
      //                       HomeCubit.get(context).screenWidth(context) * .03,
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     SizedBox(
      //                       width: HomeCubit.get(context).screenWidth(context) *
      //                           .75,
      //                       child: Text(
      //                         "Watch the Impact of your Donation".tr(),
      //                         style: const TextStyle(
      //                             fontWeight: FontWeight.w900,
      //                             fontSize: 18,
      //                             overflow: TextOverflow.ellipsis),
      //                       ),
      //                     ),
      //                     InkWell(
      //                       hoverColor: Colors.transparent,
      //                       highlightColor: Colors.transparent,
      //                       splashColor: Colors.transparent,
      //                       onTap: () {},
      //                       child: Text(
      //                         "See more".tr(),
      //                         style: const TextStyle(
      //                             color: Colors.green,
      //                             fontSize: 14,
      //                             fontWeight: FontWeight.w600),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 height:
      //                     HomeCubit.get(context).screenHeight(context) * .001,
      //               ),
      //               SizedBox(
      //                 height:
      //                     HomeCubit.get(context).screenHeight(context) * 0.3,
      //                 child: const VideoCard(),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: HomeCubit.get(context).screenHeight(context) * .03,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //               horizontal:
      //                   HomeCubit.get(context).screenWidth(context) * .03,
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     SizedBox(
      //                       width: HomeCubit.get(context).screenWidth(context) *
      //                           .75,
      //                       child: Text(
      //                         "Prayers from Good People".tr(),
      //                         style: const TextStyle(
      //                             fontWeight: FontWeight.w900, fontSize: 22),
      //                       ),
      //                     ),
      //                     InkWell(
      //                       hoverColor: Colors.transparent,
      //                       highlightColor: Colors.transparent,
      //                       splashColor: Colors.transparent,
      //                       onTap: () {},
      //                       child: Text(
      //                         "See more".tr(),
      //                         style: const TextStyle(
      //                           color: Colors.green,
      //                           fontSize: 14,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(
      //                   height:
      //                       HomeCubit.get(context).screenHeight(context) * .001,
      //                 ),
      //                 SizedBox(
      //                   height: HomeCubit.get(context).screenHeight(context) *
      //                       0.298,
      //                   child: ListView.builder(
      //                     shrinkWrap: true,
      //                     scrollDirection: Axis.horizontal,
      //                     itemBuilder: (context, index) => const PrayerCard(),
      //                     itemCount: 4,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: HomeCubit.get(context).screenHeight(context) * .03,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
