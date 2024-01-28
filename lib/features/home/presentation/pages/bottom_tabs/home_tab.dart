import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';

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
              child: const Row(
                children: [
                  CategoryCard(
                      text: "Mental Health", image: AppImages.mentalHealth),
                  CategoryCard(
                      text: "Get Back Together", image: AppImages.family),
                  CategoryCard(
                      text: "Information & Safety",
                      image: AppImages.informationSafety),
                  CategoryCard(
                      text: "more", image: AppImages.more),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       horizontal: HomeCubit.get(context).screenWidth(context) * .03),
          //   child: const Text(
          //     "Volunteer",
          //     style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          //   ),
          // ),
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
                const Text(
                  "Get Back Together",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .001,
                ),
                const Row(
                  children: [
                    Expanded(
                        child:
                            CategoryCard(text: "Lost", image: AppImages.lost)),
                    Expanded(
                        child: CategoryCard(
                            text: "Found", image: AppImages.faceScan)),
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
                const Text(
                  "Seek Help",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .001,
                ),
                const Row(
                  children: [
                    Expanded(
                        child: CategoryCard(
                            text: "Medical", image: AppImages.medical)),
                    Expanded(
                        child: CategoryCard(
                            text: "Offline Resources",
                            image: AppImages.offlineResources)),
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
                const Text(
                  "Articles",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: const Text(
                    "see more",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .001,
          ),
          AspectRatio(
            aspectRatio: 6 / 4.2,
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
                const Text(
                  "Posts",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: const Text(
                    "see more",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .001,
          ),
          AspectRatio(
            aspectRatio: 6 / 4.5,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: HomeCubit.get(context).pageController,
              children: List.generate(
                4,
                (index) => const PostCard(),
              ),
            ),
          ),
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) * .01,
          ),
        ],
      ),
    );
  }
}
