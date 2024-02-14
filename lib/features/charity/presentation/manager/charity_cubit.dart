import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'charity_state.dart';

class CharityCubit extends Cubit<CharityState> {
  CharityCubit() : super(CharityInitial());

  Future<void> generateThumbnail(String videoPath) async {
    try {
      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: videoPath,
        imageFormat: ImageFormat.PNG,
        // maxHeightOrWidth: 0,
        quality: 50,
      );

      emit(ThumbnailGenerated(thumbnailPath!));
    } catch (e) {
      // Handle any errors that occur during thumbnail generation
    }
  }
}
