import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/reels_screen.dart';
import '../manager/reel_cubit.dart';
import '../manager/reel_state.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ReelCubit()..fetchVideos(),
      child: BlocConsumer<ReelCubit, ReelState>(
          listener: (BuildContext context, ReelState state) {},
          builder: (context, state) {
            if (state is ReelSuccessState) {
              return SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: state.videos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: index == 0 || index == state.videos.length - 1
                          ? EdgeInsets.only(
                              left: index == 0 ? 10.w : 2.w,
                              right: index == 0 ? 2.w : 10.w,
                            )
                          : const EdgeInsets.symmetric(horizontal: 2),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.sp)),
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: [Colors.transparent, Colors.black],
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.darken,
                              child: Image.network(
                                state.videos[index].thumbnail,
                                fit: BoxFit.cover,
                                width: 180.w,
                                height: 250.h,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReelsScreen(
                                    video: state.videos[index],
                                    videos: state.videos,
                                  ),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.play_circle_outline,
                              color: AppColors.green,
                              size: 50.sp,
                            ),
                          ),
                          Positioned(
                            bottom: 6.h,
                            left: 10.w,
                            child: SizedBox(
                              height: 30.h,
                              width: 160.w,
                              child: Text(
                                state.videos[index].name,
                                style: TextStyle(
                                    color: AppColors.green,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.sp,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is ReelLoadingState) {
              return SizedBox(
                width: 200.w,
                height: 260,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is ReelErrorState) {
              return Center(
                  child: Text(
                state.error,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ));
            } else {
              return const Center(
                child: Text(
                  "hii",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              );
            }
          }),
    );
  }
}
