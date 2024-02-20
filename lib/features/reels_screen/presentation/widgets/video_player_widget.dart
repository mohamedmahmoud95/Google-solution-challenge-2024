import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/profile_videos_tab.dart';
import 'package:video_player/video_player.dart';

import '../../data/model/video_model.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoModel video;

  final String shareNumString;

  final String commentNumString;

  final String reactNumString;

  const VideoPlayerWidget({
    super.key,
    required this.video,
    required this.reactNumString,
    required this.commentNumString,
    required this.shareNumString,
  });

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.mediaUrl))
          ..initialize().then((_) {
            setState(() {
              _controller.play();
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.value.isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            height: HomeCubit.get(context).screenHeight(context) - 80,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.black26, Colors.black26],
                  begin: Alignment.center,
                  end: Alignment.bottomLeft,
                ).createShader(bounds);
              },
              blendMode: BlendMode.darken,
              child: VideoPlayer(
                _controller,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(videos: []),
                        ),
                      );
                    },
                    child: const Text(
                      "User Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.video.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 6,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Column(
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.reactNumString,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.commentNumString,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: PopupMenuButton(
                    icon: const Icon(Icons.more_horiz),
                    iconColor: Colors.white,
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "report",
                        child: Text("Report"),
                      ),
                      const PopupMenuItem(
                        value: "Unfollow",
                        child: Text("Unfollow"),
                      ),
                      const PopupMenuItem(
                        value: "copy link",
                        child: Text("Copy Link"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 30,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 30,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
