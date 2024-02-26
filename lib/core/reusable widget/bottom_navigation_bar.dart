import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../features/home/presentation/manager/cubit.dart';
import '../../features/home/presentation/manager/states.dart';
import '../utils/app_colors.dart';

class ZaitoonBottomNavigationBar extends StatefulWidget {
  const ZaitoonBottomNavigationBar({super.key});

  @override
  State<ZaitoonBottomNavigationBar> createState() => _ZaitoonBottomNavigationBarState();
}

class _ZaitoonBottomNavigationBarState extends State<ZaitoonBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {},
      builder: (context, state) => Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 25, top: 10),
        child: GNav(
            rippleColor: AppColors.oliveGreen0,
            hoverColor: AppColors.oliveGreen0,
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(
                color: AppColors.white, width: 0), // tab button border
            tabBorder: Border.all(
                color: AppColors.white, width: 0), // tab button border
            tabShadow: const [
              BoxShadow(color: AppColors.white, blurRadius: 0)
            ], // tab button shadow
            curve: Curves.ease, // tab animation curves
            duration:
                const Duration(milliseconds: 500), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: AppColors.black0000, // unselected icon color
            activeColor: AppColors.black0000, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                AppColors.oliveGreen0, // selected tab background color
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
                onPressed: () {
                  HomeCubit.get(context).onNavItemTapped(0);
                },
              ),
              GButton(
                icon: LineIcons.stethoscope,
                text: 'Med support',
                onPressed: () {
                  HomeCubit.get(context).onNavItemTapped(1);
                },
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
                onPressed: () {
                  HomeCubit.get(context).onNavItemTapped(2);
                },
              ),
              GButton(
                icon: LineIcons.ambulance,
                text: 'Emergency',
                onPressed: () {
                  HomeCubit.get(context).onNavItemTapped(3);
                },
              ),
            ]),
      ),
    );
  }
}
