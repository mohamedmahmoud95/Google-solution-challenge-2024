import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/profile_videos_tab.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddReelScreen extends StatefulWidget {
  const AddReelScreen({super.key});

  @override
  AddReelScreenState createState() => AddReelScreenState();
}

class AddReelScreenState extends State<AddReelScreen> {
  late File _videoFile = File('');
  final TextEditingController _captionController = TextEditingController();

  Future<void> _selectVideo() async {
    final pickedFile =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }

  Widget _buildVideoPlayer() {
    if (_videoFile.path.isEmpty) {
      return GestureDetector(
        onTap: _selectVideo,
        child: Container(
          color: Colors.black,
          height: 200.h,
          width: double.infinity,
          child: const Icon(Icons.add_circle_outline,
              size: 50, color: Colors.white),
        ),
      );
    } else {
      final controller = VideoPlayerController.file(_videoFile);
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Add Reel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(videos: []),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVideoPlayer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                child: TextField(
                  controller: _captionController,
                  decoration: const InputDecoration(hintText: 'Enter caption'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }
}
