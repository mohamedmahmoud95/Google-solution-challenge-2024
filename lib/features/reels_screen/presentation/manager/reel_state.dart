import '../../data/model/video_model.dart';

abstract class ReelState {}

class ReelInitState extends ReelState {}

class ReelLoadingState extends ReelState {}

class ReelSuccessState extends ReelState {
  List<VideoModel> videos;

  ReelSuccessState({required this.videos});
}

class ReelErrorState extends ReelState {
  String error;

  ReelErrorState(this.error);
}

class ReelChangeTabState extends ReelState {}

class ReelPickFileState extends ReelState {}
