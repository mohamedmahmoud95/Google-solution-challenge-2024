import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 21.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            right: 15.0.w, left: 15.w, bottom: isPrayer ? 80.h : 0),
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
                              Text(
                                "Watch The Impact of Your Donation",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25.sp,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.sp)),
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
                                            width: 200.w,
                                            height: 260.h,
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
                                          color: Colors.green,
                                          size: 40.sp,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0.h,
                                        left: 6.w,
                                        child: SizedBox(
                                          height: 30.h,
                                          width: 180.w,
                                          child: Text(
                                            state.videos[index].name,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.sp,
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
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        );
                      } else if (state is ReelLoadingState) {
                        return SizedBox(
                          width: 500.w,
                          height: 500.h,
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
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return index == 5 ? SizedBox(height: 10.h) : body;
                },
                itemCount: 5,
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isPrayer
          ? SizedBox(
              width: double.infinity,
              height: 75.h,
              child: FloatingActionButton(
                isExtended: true,
                onPressed: () {},
                child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Send your prayer...",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black38,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.send)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            12.sp,
                          ),
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20.sp,
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
