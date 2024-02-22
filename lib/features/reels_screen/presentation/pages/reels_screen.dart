import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/profile_videos_tab.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/reel_tab.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/video_tab.dart';
import '../../data/model/video_model.dart';
import '../manager/reel_cubit.dart';
import '../manager/reel_state.dart';

class ReelsScreen extends StatelessWidget {
  final VideoModel video;
  final List<VideoModel> videos;

  const ReelsScreen({
    required this.video,
    required this.videos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> tabsOptions = [
      ReelTab(video: video, videos: videos),
      const AddReelScreen(),
      ProfileScreen(
        videos: videos,
      ),
    ];
    return BlocProvider(
      create: (BuildContext context) => ReelCubit()..fetchVideos(),
      child: BlocConsumer<ReelCubit, ReelState>(
        listener: (BuildContext context, ReelState state) {},
        builder: (context, state) {
          return Scaffold(
            body: tabsOptions[ReelCubit.get(context).selectedIndex],
            bottomNavigationBar: SizedBox(
              height: 60.h,
              child: BottomNavigationBar(
                currentIndex: ReelCubit.get(context).selectedIndex,
                onTap: ReelCubit.get(context).onItemTapped,
                backgroundColor: Colors.black,
                iconSize: 26.sp,
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                unselectedItemColor: Colors.white,
                elevation: 10,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: const Icon(Icons.slow_motion_video),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: const Icon(Icons.add),
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: const Icon(Icons.person_outlined),
                    ),
                    label: "",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
