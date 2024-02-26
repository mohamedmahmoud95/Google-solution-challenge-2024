import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_solution_challenge_2024/config/routes.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/auth/firebase_auth_services.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/states.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../core/reusable widget/bottom_navigation_bar.dart';
import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void logOut(BuildContext context) async {
    FirebaseAuthServices firebaseAuthServices =
        FirebaseAuthServices(FirebaseAuth.instance);
    await firebaseAuthServices.logout();
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (context, state) => Scaffold(
        bottomNavigationBar: ZaitoonBottomNavigationBar(),

        drawer: Drawer(
          width: ScreenUtils.getScreenWidth(context) / 1.5,
          backgroundColor: AppColors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.oliveGreen1,
                ),
                child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                  height: ScreenUtils.getScreenHeight(context)/7.5 ,
                  width:  ScreenUtils.getScreenWidth(context)/3.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: ImageUtils.getImage(AppImages.raslan), fit: BoxFit.cover, ),
                      borderRadius: BorderRadius.circular(AppMeasures.defaultCircularRadius)

                  ),
                ),
                  SizedBox(
                    height:ScreenUtils.getScreenHeight(context)/15 ,
                    width:  ScreenUtils.getScreenWidth(context)/4,
                    child: const Text("Mohamed Raslan", maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, ), ),),
                ],),
                // Text(
                //   'Drawer Header',
                //   style: TextStyle(
                //     color: AppColors.darkGreen2,
                //     fontSize: AppMeasures.vargeFontSize40,
                //   ),
                // ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Settings'.tr(),
                      style: const TextStyle(
                          fontSize: AppMeasures.largeFontSize30),
                    ),
                    const Icon(Icons.settings_outlined),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.settings);
                  // Add your logic for when item 1 is tapped
                },
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Divider(
                  color: AppColors.oliveGreen1,
                  thickness: 0.5,
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout'.tr(),
                      style: const TextStyle(
                          fontSize: AppMeasures.largeFontSize30),
                    ),
                    const Icon(Icons.logout)
                  ],
                ),
                onTap: () {
                  logOut(context);
                },
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: true,
              elevation: 0,
              backgroundColor: AppColors.white,
              title: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "welcome back".tr(),
                      style: const TextStyle(
                          fontSize: AppMeasures.mediumFontSize20),
                      textAlign: TextAlign.start,
                    ),
                    const Text(
                      "Mohamed",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGreen2),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: HomeCubit.get(context)
                  .widgetOptions[HomeCubit.get(context).selectedIndex],
            ),
          ],
        ),
        // body: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       floating: true,
        //       snap: true,
        //       //غيره من هنا
        //       pinned: true,
        //       elevation: 0,
        //       backgroundColor: Colors.white,
        //       title: SizedBox(
        //         width: double.infinity,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               "welcome back".tr(),
        //               style: const TextStyle(fontSize: 10),
        //               textAlign: TextAlign.start,
        //             ),
        //             const Text(
        //               "Mohamed",
        //               style: TextStyle(fontWeight: FontWeight.w900),
        //               textAlign: TextAlign.start,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     SliverToBoxAdapter(
        //       child: HomeCubit.get(context)
        //           .widgetOptions[HomeCubit.get(context).selectedIndex],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
