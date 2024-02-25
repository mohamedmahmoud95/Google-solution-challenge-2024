import 'package:flutter/cupertino.dart';

class ImageUtils{
  static ImageProvider? getImage(String? imageUrl)
  {
    ImageProvider? imageProvider ;
    if (imageUrl != null && imageUrl.isNotEmpty)
    {
      if (imageUrl.startsWith('http')){
        imageProvider = NetworkImage(imageUrl!);
      }
      else
      {
        imageProvider = AssetImage(imageUrl!,);
      }
    }
    return imageProvider!;
  }
}