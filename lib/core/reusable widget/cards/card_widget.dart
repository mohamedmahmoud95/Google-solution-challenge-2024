import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  final Function? onClicked;

  const CardWidget(
      {super.key,
      required this.title,
      this.imageUrl,
      this.height,
      this.width,
      this.imageHeight,
      this.imageWidth,
      this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClicked != null) {
          onClicked!();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: SizedBox(
          height: height ?? ScreenUtils.getScreenHeight(context) / 5,
          width: width ?? ScreenUtils.getScreenWidth(context) / 2 - 20,
          child: Card(
            elevation: 0,
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageUrl == null
                      ? const SizedBox()
                      : SizedBox(
                          height: imageHeight ??
                              ScreenUtils.getScreenHeight(context) / 5.5 - 75,
                          width: imageWidth ??
                              ScreenUtils.getScreenWidth(context) / 2 - 20,
                          child: Image.asset(
                            "$imageUrl",
                            fit: BoxFit.contain,
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
