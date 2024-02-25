import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/cards/feature_card.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import 'package:google_solution_challenge_2024/features/news_feed/presentation/widget/horizontally_scrollable_list_of_newsfeed_cards.dart';
import 'package:google_solution_challenge_2024/features/news_feed/sampleStaticData/sample_newsfeed_posts.dart';
import '../../widgets/category_card.dart';
import '../../widgets/help_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: HomeCubit.get(context).screenWidth(context) * .02,
                  vertical: HomeCubit.get(context).screenWidth(context) * .02),
              child: Row(
                children: [

                  FeatureCard(title: 'Mental health', imageUrl: AppImages.mentalHealthSupport,
                    onClicked: (){
                      Navigator.of(context).pushNamed('mentalHealthSupport');
                    },),

                  FeatureCard(title: 'Find a lost person', imageUrl: AppImages.faceRecognition,
                    onClicked: (){
                      Navigator.of(context).pushNamed('lostAndFound');
                    },),

                  FeatureCard(title: 'Empowerment market', imageUrl: AppImages.market_place,
                    onClicked: (){
                      Navigator.of(context).pushNamed('MarketPlaceScreen');
                    },),


                ],
              ),
            ),
          ),
          // Swiper(
          //   // duration: 80,
          //   // autoplay: true,
          //   viewportFraction: 0,
          //   itemBuilder: (BuildContext context, int index) {
          //     return HelpCard(
          //       index: index,
          //       buttonChild: Text(
          //         "See more",
          //         style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 12.sp,
          //           color: Colors.black,
          //         ),
          //       ),
          //     );
          //   },
          //   itemCount: 1,
          //   itemWidth: double.infinity,
          //   itemHeight: 300.0,
          //   layout: SwiperLayout.TINDER,
          // ),
          // SizedBox(
          //   height: HomeCubit.get(context).screenHeight(context) * .03,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: HomeCubit.get(context).screenWidth(context) * .03,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Get Back Together".tr(),
          //         style: const TextStyle(
          //             fontWeight: FontWeight.w500, fontSize: 20),
          //       ),
          //       ),
          //       SizedBox(
          //         height: HomeCubit.get(context).screenHeight(context) * .001,
          //       ),
          //       Row(
          //         children: [
          //           Expanded(
          //               child: CategoryCard(
          //             text: "Lost".tr(),
          //             image: AppImages.lost,
          //             onTap: () {
          //               Navigator.of(context).pushNamed('lostAndFound');
          //             },
          //           )),
          //           Expanded(
          //               child: CategoryCard(
          //             text: "Found".tr(),
          //             image: AppImages.faceScan,
          //             onTap: () {
          //               Navigator.of(context).pushNamed('lostAndFound');
          //             },
          //           )),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
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
                Text(
                  "Seek Help".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .001,
                ),

                Row(
                  children: [

                    FeatureCard(title: 'Medical support', imageUrl: AppImages.medical,
                      onClicked: (){
                        Navigator.of(context).pushNamed('OfflineResourcesScreen');
                      },),


                    FeatureCard(title: 'Emergency', imageUrl: AppImages.emergency,
                      onClicked: (){
                        Navigator.of(context).pushNamed('OfflineResourcesScreen');
                      },),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .03,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: HomeCubit.get(context).screenWidth(context) * .03),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Articles".tr(),
          //         style: const TextStyle(
          //             fontWeight: FontWeight.w900, fontSize: 25),
          //       ),
          //       InkWell(
          //         hoverColor: Colors.transparent,
          //         highlightColor: Colors.transparent,
          //         splashColor: Colors.transparent,
          //         onTap: () {},
          //         child: Text(
          //           "see more".tr(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: HomeCubit.get(context).screenHeight(context) * .001,
          // ),
          // SizedBox(
          //   height: HomeCubit.get(context).screenHeight(context) * .5,
          //   child: PageView(
          //     scrollDirection: Axis.horizontal,
          //     controller: HomeCubit.get(context).pageController,
          //     // onPageChanged: (value) {
          //     //   productProvider.onPageChanged(value);
          //     // },
          //     children: List.generate(
          //       4,
          //       (index) => NewsCard(index),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: HomeCubit.get(context).screenHeight(context) * .03,
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: HomeCubit.get(context).screenWidth(context) * .03),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Posts".tr(),
          //         style: const TextStyle(
          //             fontWeight: FontWeight.w900, fontSize: 25),
          //       ),
          //       InkWell(
          //         hoverColor: Colors.transparent,
          //         highlightColor: Colors.transparent,
          //         splashColor: Colors.transparent,
          //         onTap: () {},
          //         child: Text(
          //           "see more".tr(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: HomeCubit.get(context).screenHeight(context) * .001,
          // ),
          //
          // SizedBox(
          //   height: HomeCubit.get(context).screenHeight(context) * .001,
          // ),
          // SizedBox(
          //   height: HomeCubit.get(context).screenHeight(context) * .59,
          //   child: PageView(
          //     scrollDirection: Axis.horizontal,
          //     controller: HomeCubit.get(context).pageController,
          //     children: List.generate(
          //       4,
          //       (index) => PostCard(
          //         index: index,
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .01,
          ),

          HorizontallyScrollableListOfNewsFeedCards(
              listOfNewsFeedPosts: sampleNewsFeedPosts),
        ],
      ),
    );
  }
}
