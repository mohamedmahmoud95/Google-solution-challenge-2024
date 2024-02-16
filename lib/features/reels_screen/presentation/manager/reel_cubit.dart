import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/manager/reel_state.dart';
import '../../data/model/video_model.dart';

class ReelCubit extends Cubit<ReelState> {
  ReelCubit() : super(ReelInitState());

  static ReelCubit get(context) => BlocProvider.of(context);

  ScrollController videoScrollController = ScrollController(initialScrollOffset: 0);

  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  Future<List<VideoModel>> fetchVideos() async {
    emit(ReelLoadingState());
    try {
      DataSnapshot dataSnapshot =
          (await databaseReference.child('videos').once()).snapshot;
      List<VideoModel> videos = [];
      if (kDebugMode) {
        print(dataSnapshot.value);
      }
      if (dataSnapshot.value != null && dataSnapshot.value is List) {
        List<dynamic> values = dataSnapshot.value as List<dynamic>;
        for (var value in values) {
          videos.add(VideoModel(
            commentNum: value['commentNum'] ?? 0.0,
            mediaUrl: value['mediaUrl'] ?? '',
            name: value['name'] ?? '',
            reactNum: value['reactNum'] ?? 0.0,
            shareNum: value['shareNum'] ?? 0.0,
            thumbnail: value['thumbnail'] ?? '',
          ));
        }
      }

      emit(ReelSuccessState(videos: videos));
      if (kDebugMode) {
        print('videos: $videos');
      }

      return videos;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching videos: $e');
      }

      emit(ReelErrorState(e.toString()));
      return [];
    }
  }

  static FirebaseDatabase firebaseDatabase = FirebaseDatabase();

  addVideoToRealTime() async {
    try {
      await firebaseDatabase.ref("videos").push().set(VideoModel(
              reactNum: 5,
              shareNum: 5,
              commentNum: 5,
              name: "some name",
              mediaUrl:
                  "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
              thumbnail:
                  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg")
          .toJson());
    } catch (e) {
      print(e);
    }
  }

  String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      String formatted = '${(number / 1000).toStringAsFixed(1)}K';
      if (formatted.endsWith('.0')) {
        return '${formatted.substring(0, formatted.length - 2)}K';
      } else {
        return formatted;
      }
    } else {
      return number.toString();
    }
  }
}
