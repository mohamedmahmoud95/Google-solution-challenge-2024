import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/profile_videos_tab.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/reel_tab.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/video_tab.dart';
import 'package:shimmer/shimmer.dart';
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
          if (state is ReelSuccessState) {
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
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              period: const Duration(milliseconds: 1000),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        width: 120,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        width: 80,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
