import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../reels_screen/presentation/manager/reel_cubit.dart';
import '../../../reels_screen/presentation/manager/reel_state.dart';
import '../../../reels_screen/presentation/pages/reels_screen.dart';

class SeeMoreScreen extends StatelessWidget {
  final String screenTitle;
  final Widget body;

  final bool isVideos;
  final bool isPrayer;

  const SeeMoreScreen(
      {required this.screenTitle,
      this.isVideos = false,
      this.isPrayer = false,
      required this.body,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          isVideos ? "" : screenTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 15.0,
          left: 15,
        ),
        child: isVideos
            ? BlocProvider(
                create: (BuildContext context) => ReelCubit()..fetchVideos(),
                child: BlocConsumer<ReelCubit, ReelState>(
                    listener: (BuildContext context, ReelState state) {},
                    builder: (context, state) {
                      if (state is ReelSuccessState) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text(
                                "Watch The Impact of Your Donation",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                ),
                              ),
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                  childAspectRatio: 0.79,
                                ),
                                shrinkWrap: true,
                                itemCount: state.videos.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        child: ShaderMask(
                                          shaderCallback: (Rect bounds) {
                                            return const LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Colors.black
                                              ],
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
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
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
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return index == 5 ? const SizedBox(height: 15) : body;
                },
                itemCount: 6,
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isPrayer
          ? SizedBox(
              width: double.infinity,
              height: 100,
              child: FloatingActionButton(
                isExtended: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                onPressed: () {},
                child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Send your prayer...",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.send)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12,
                          ),
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
