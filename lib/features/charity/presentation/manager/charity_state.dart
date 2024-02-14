abstract class CharityState {}

class CharityInitial extends CharityState {}

class ThumbnailGenerated extends CharityState {
  final String thumbnailPath;

  ThumbnailGenerated(this.thumbnailPath);
}
