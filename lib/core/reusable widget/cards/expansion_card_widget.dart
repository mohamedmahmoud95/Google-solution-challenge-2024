import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import '../../../../core/utils/screen_utils.dart';

class ExpansionCardWidget extends StatelessWidget {
  final Function onTap;
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  const ExpansionCardWidget(
      {super.key,
      required this.onTap,
      this.imageUrl,
      this.title,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            clipBehavior: Clip.hardEdge,
            shadowColor: AppColors.offWhite,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppMeasures.defaultCircularRadius),
            ),

        child: ExpansionTile(
          initiallyExpanded: true,
          backgroundColor: AppColors.offWhite,
          title: Text("[${1}]${title!}"),
          collapsedBackgroundColor: AppColors.offWhite,
          collapsedIconColor: AppColors.oliveGreen2,
          iconColor: AppColors.oliveGreen2,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                        image: ImageUtils.getImage(imageUrl!)!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ),
                          subtitle == null
                              ? SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          subtitle == null
                              ? SizedBox()
                              : SizedBox(
                                  width:
                                      ScreenUtils.getScreenWidth(context) / 2,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    " ${subtitle!}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
