import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import 'package:google_solution_challenge_2024/features/news_feed/sampleStaticData/sample_newsfeed_posts.dart';

import '../../../../news_feed/presentation/widget/news_feed_card.dart';
import '../../widgets/category_card.dart';
import '../../widgets/help_card.dart';
import '../../widgets/news_card.dart';
import '../../widgets/post_card.dart';

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

              child:  Row(
                children: [
                  CategoryCard(
                      text: "Mental Health".tr(), image: AppImages.mentalHealth,
                    onTap: (){
                        Navigator.of(context).pushNamed('mentalHealthSupport');
                   //   builder: (context) => const LostAndFoundScreen()));
                        },),
                  CategoryCard(
                      text: "Get Back Together".tr(), image: AppImages.family),
                  CategoryCard(
                      text: "Information & Safety".tr(),
                      image: AppImages.informationSafety),
                  CategoryCard(text: "more".tr(), image: AppImages.more),
                ],
              ),
            ),
          ),
          Swiper(
            // duration: 80,
            // autoplay: true,
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
                Text(
                  "Get Back Together".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 25),
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .001,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CategoryCard(
                      text: "Lost".tr(),
                      image: AppImages.lost,
                      onTap: () {
                        Navigator.of(context).pushNamed('lostAndFound');
                      },
                    )),
                    Expanded(
                        child: CategoryCard(
                      text: "Found".tr(),
                      image: AppImages.faceScan,
                      onTap: () {
                        Navigator.of(context).pushNamed('lostAndFound');
                      },
                    )),
                  ],
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
                Text(
                  "Seek Help".tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .001,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CategoryCard(
                        text: "Medical".tr(),
                        image: AppImages.medical,
                      ),
                    ),
                    Expanded(
                      child: CategoryCard(
                        text: "Offline Resources".tr(),
                        image: AppImages.offlineResources,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: HomeCubit.get(context).screenWidth(context) * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Articles".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 25),
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Text(
                    "see more".tr(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .001,
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .5,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: HomeCubit.get(context).pageController,
              // onPageChanged: (value) {
              //   productProvider.onPageChanged(value);
              // },
              children: List.generate(
                4,
                (index) => NewsCard(index),
              ),
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: HomeCubit.get(context).screenWidth(context) * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Posts".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 25),
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child:  Text(
                    "see more".tr(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .001,
          ),

          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .001,
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .576,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: HomeCubit.get(context).pageController,
              children: List.generate(
                4,
                (index) => PostCard(
                  index: index,
                ),
              ),
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .01,
          ),

          NewsFeedCard(newsFeedPost: sampleNewsFeedPost1,),
          Container(height: 100,color: Colors.purple,)

        ],
      ),
    );
  }
}
