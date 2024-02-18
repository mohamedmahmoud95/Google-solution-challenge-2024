import 'package:flutter/material.dart';
import '../../../data/model/video_model.dart';
import '../../manager/reel_cubit.dart';
import '../../widgets/video_player_widget.dart';

class ReelTab extends StatelessWidget {
  final VideoModel video;
  final List<VideoModel> videos;

  const ReelTab({required this.video, required this.videos, super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoPlayerWidget(
          video: index == 0 ? video : videos[index - 1],
          reactNumString: ReelCubit.get(context).formatNumber(video.reactNum),
          commentNumString: ReelCubit.get(context).formatNumber(video.reactNum),
          shareNumString: ReelCubit.get(context).formatNumber(video.reactNum),
        );
      },
    );
  }
}
