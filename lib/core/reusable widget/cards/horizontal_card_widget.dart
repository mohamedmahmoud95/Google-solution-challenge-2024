import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import '../../../../core/utils/screen_utils.dart';

class HorizontalCard extends StatelessWidget {
  final Function onTap;
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  const HorizontalCard({super.key, required this.onTap, this.imageUrl, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0,
          color: Colors.grey.shade200,
          // color: Colors.green.shade100,
          child: Padding(
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
                      image:
                      ImageUtils.getImage(imageUrl!)!,
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

                        subtitle == null? SizedBox() :
                        const SizedBox(
                          height: 10,
                        ),

                        subtitle == null? SizedBox() :
                        SizedBox(
                          width: ScreenUtils.getScreenWidth(context) / 2,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            " ${subtitle!}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
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