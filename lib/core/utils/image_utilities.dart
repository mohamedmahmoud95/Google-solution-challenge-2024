import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:image/image.dart' as imageLib; //  for image loading

class ImageUtils {
  static ImageProvider<Object> getImage(String? imageUrl)  {
    if (imageUrl == null || imageUrl.isEmpty) {
      return const AssetImage(AppImages.no_image);
    }

    ImageProvider? imageProvider;

    if (imageUrl.startsWith('http') || imageUrl.startsWith('HTTP')) {
      imageProvider = NetworkImage(imageUrl);
    }
    // else if (imageUrl.toLowerCase().endsWith('.svg')) {
    //   imageProvider = await getSVGImage(imageUrl);
    // }
    else {
      imageProvider = AssetImage(imageUrl);
    }

    return imageProvider;
  }

  static Future<ImageProvider<Object>?> getSVGImage(String? imageUrl) async {
    ImageProvider? imageProvider;
    final svgString = await SvgPicture.asset(imageUrl!);
    final bytes = utf8.encode(svgString.toString());
    imageProvider = MemoryImage(bytes);
    return imageProvider;
  }
}
