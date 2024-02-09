import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/widget/service_card.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/widget/sessions_card.dart';

class MentalHealthSupportScreen extends StatefulWidget {
  const MentalHealthSupportScreen({super.key});

  @override
  State<MentalHealthSupportScreen> createState() =>
      _MentalHealthSupportScreenState();
}

class _MentalHealthSupportScreenState extends State<MentalHealthSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: BackButton(),
        title: Text("Mental Health Support"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: ScreenUtils.getScreenHeight(context) / 3,
                    width:  ScreenUtils.getScreenWidth(context) - 50,
                    child: Swiper(
                      // duration: 80,
                      // autoplay: true,
                      viewportFraction: 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SessionCard(index);
                      },
                      itemCount: 1,
                      itemWidth: double.infinity,
                      itemHeight: ScreenUtils.getScreenHeight(context) / 3,
                      layout: SwiperLayout.TINDER,
                    ),
                  ),
                  Container(
                    height: ScreenUtils.getScreenHeight(context) / 3,
                    width: ScreenUtils.getScreenWidth(context) - 50,
                    child: Swiper(
                      // duration: 80,
                      // autoplay: true,
                      viewportFraction: 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SessionCard(index);
                      },
                      itemCount: 1,
                      itemWidth: double.infinity,
                      itemHeight: ScreenUtils.getScreenHeight(context) / 3,
                      layout: SwiperLayout.TINDER,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            seekHelpSection(),
            const SizedBox(
              height: 10,
            ),
            articlesSection(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget seekHelpSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Seek help",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ServiceCard(
                title: "one to one",
                imageUrl: "${AppImages.mentalHealthSupport}"),
            ServiceCard(
                title: "Group therapy", imageUrl: "${AppImages.groupTherapy}")
          ],
        ),
      ],
    );
  }

  Widget articlesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Know more",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 210,
              width: 180,
              child: Swiper(
                // duration: 80,
                // autoplay: true,
                viewportFraction: 0,
                itemBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                      height: 160,
                      child: ServiceCard(
                        title: 'Articles',
                        imageUrl: AppImages.offlineResources,
                      ));
                },
                itemCount: 1,
                itemWidth: double.infinity,
                itemHeight: 220.0,

                layout: SwiperLayout.TINDER,
              ),
            ),
            Container(
              height: 210,
              width: 180,
              child: Swiper(
                // duration: 80,
                // autoplay: true,
                viewportFraction: 0,
                itemBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                      height: 160,
                      child: ServiceCard(
                        title: 'Videos',
                        imageUrl: AppImages.video,
                      ));
                },
                itemCount: 1,
                itemWidth: double.infinity,
                itemHeight: 220.0,

                layout: SwiperLayout.TINDER,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
