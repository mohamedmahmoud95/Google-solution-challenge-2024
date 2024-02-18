import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                              left: index == 0 ? 10 : 2,
                              right: index == 0 ? 2 : 10,
                            )
                          : const EdgeInsets.symmetric(horizontal: 2),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
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
                                width: 200,
                                height: 260,
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
                            child: const Icon(
                              Icons.play_circle_outline,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            left: 14,
                            child: SizedBox(
                              height: 30,
                              width: 180,
                              child: Text(
                                state.videos[index].name,
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 2,
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
              return const SizedBox(
                width: 500,
                height: 500,
                child: Center(
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
