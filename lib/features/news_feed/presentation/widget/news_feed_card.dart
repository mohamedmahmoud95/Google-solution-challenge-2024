import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import '../../domain/entity/post.dart';

class NewsFeedCard extends StatefulWidget {
  final NewsFeedPost newsFeedPost;
  const NewsFeedCard({super.key, required this.newsFeedPost});

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (widget.newsFeedPost.imageUrl != null &&
        widget.newsFeedPost.imageUrl!.isNotEmpty) {
      imageProvider = NetworkImage(widget.newsFeedPost.imageUrl!);
    } else {
      imageProvider = null;
    }

    return Padding(
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: ScreenUtils.getScreenWidth(context) - 50,
            decoration: BoxDecoration(
              color: AppColors.oliveGreen2,
              borderRadius:
                  BorderRadius.circular(AppMeasures.defaultCircularRadius),
              image: DecorationImage(
                image: imageProvider!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.black1
                        .withOpacity(0.9), // Darker grey at the bottom
                    AppColors.grey4.withOpacity(0.1), // Lighter grey at the top
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft:
                      Radius.circular(AppMeasures.defaultCircularRadius),
                  bottomRight:
                      Radius.circular(AppMeasures.defaultCircularRadius),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: 20,
                        width: 120,
                        decoration: BoxDecoration(
                          color: AppColors.grey1.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(AppMeasures.defaultCircularRadius),
                        ),
                        child: Row(
                          children: [
                            Image.network(widget.newsFeedPost.newsSource?.logoUrl ?? 'fallback_url'),

                            Text(
                              widget.newsFeedPost.newsSource!.name!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),

                      Text(
                        widget.newsFeedPost.title ??
                            (widget.newsFeedPost.content != null &&
                                    widget.newsFeedPost.content!.length > 400
                                ? widget.newsFeedPost.content!.substring(0, 400)
                                : widget.newsFeedPost.content),
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
