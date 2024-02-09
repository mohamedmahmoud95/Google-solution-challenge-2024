import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/config/routes.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/states.dart';

import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                     color: AppColors.green,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title:  Text('Settings'.tr()),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.settings);
                    // Add your logic for when item 1 is tapped
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Add your logic for when item 2 is tapped
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
                //غيره من هنا
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                title: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome back".tr(),
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.start,
                      ),
                      const Text(
                        "Mohamed",
                        style: TextStyle(fontWeight: FontWeight.w900),
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
        ),
      ),
    );
  }
}
