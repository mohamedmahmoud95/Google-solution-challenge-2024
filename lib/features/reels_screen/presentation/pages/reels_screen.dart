import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/video_model.dart';
import '../manager/reel_cubit.dart';
import '../manager/reel_state.dart';
import '../widgets/video_player_widget.dart';

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
    return BlocProvider(
      create: (BuildContext context) => ReelCubit()..fetchVideos(),
      child: BlocConsumer<ReelCubit, ReelState>(
        listener: (BuildContext context, ReelState state) {},
        builder: (context, state) => Scaffold(
          body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return VideoPlayerWidget(
                video: index == 0 ? video : videos[index - 1],
                reactNumString:
                    ReelCubit.get(context).formatNumber(video.reactNum),
                commentNumString:
                    ReelCubit.get(context).formatNumber(video.reactNum),
                shareNumString:
                    ReelCubit.get(context).formatNumber(video.reactNum),
              );
            },
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
              iconSize: 30,
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
              ),
              unselectedItemColor: Colors.white,
              elevation: 10,
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.slow_motion_video),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.add),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.person_outlined),
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
