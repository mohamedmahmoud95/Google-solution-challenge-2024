import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/dummy_data.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/widget/feature_card.dart';
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
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Mental Health Support"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Align(
                alignment: Alignment.center,
                child:
                  // Container(
                  //   height: ScreenUtils.getScreenHeight(context) / 3,
                  //   width:  ScreenUtils.getScreenWidth(context) - 50,
                  //   child: Swiper(
                  //     // duration: 80,
                  //     // autoplay: true,
                  //     viewportFraction: 0,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return SessionCard(index);
                  //     },
                  //     itemCount: 1,
                  //     itemWidth: double.infinity,
                  //     itemHeight: ScreenUtils.getScreenHeight(context) / 3,
                  //     layout: SwiperLayout.TINDER,
                  //   ),
                  // ),
                  Container(
                    height: ScreenUtils.getScreenHeight(context) / 2.75,
                    width: ScreenUtils.getScreenWidth(context) - 10,
                    child: Swiper(
                      // duration: 80,
                      // autoplay: true,
                      viewportFraction: 0,
                      itemBuilder: (BuildContext context, int index) {
                        return SessionCard(index: index, onlineSession: sampleOnlineSessions[index], );
                      },
                      itemCount: sampleOnlineSessions.length,
                      itemWidth: double.infinity,
                      itemHeight: ScreenUtils.getScreenHeight(context) / 2.75,
                      layout: SwiperLayout.TINDER,
                    ),
                  ),

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Seek help",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FeatureCard(
                title: "one to one",
                imageUrl: AppImages.mentalHealthSupport,
              onClicked: (){
                  Navigator.of(context).pushNamed('selectTherapistScreen');
              },

            ),
             FeatureCard(
                title: "Group therapy", imageUrl: AppImages.groupTherapy,
              onClicked: (){
                Navigator.of(context).pushNamed('selectTherapyGroupScreen');
              },

            )
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
            "Learn more",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(

              child:
                //   Swiper(
                // duration: 80,
                // autoplay: true,

                // viewportFraction: 0,
                // itemBuilder: (BuildContext context, int index) {
                //   return
                    const SizedBox(

                      child:

                  FeatureCard(
                        title: 'Articles',
                        imageUrl: AppImages.reading2,
                      )),
                //},
              //   itemCount: 1,
              //   itemWidth: double.infinity,
              //   itemHeight: 220.0,
              //
              //   layout: SwiperLayout.TINDER,
              // ),
            ),
            Container(

              child:
              // Swiper(
              //   // duration: 80,
              //   // autoplay: true,
              //   viewportFraction: 0,
              //   itemBuilder: (BuildContext context, int index) {
              //     return
                    const SizedBox(

                      child: FeatureCard(
                        title: 'Videos',
                        imageUrl: AppImages.video_tutorial,
                      )),
    //  },
                // itemCount: 1,
                // itemWidth: double.infinity,
                // itemHeight: 220.0,
                //
                // layout: SwiperLayout.TINDER,
             // ),
            ),
          ],
        ),
      ],
    );
  }
}
