import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/news_feed/presentation/widget/news_feed_card.dart';

import '../../domain/entity/post.dart';

class HorizontallyScrollableListOfNewsFeedCards extends StatelessWidget {
  final List<NewsFeedPost> listOfNewsFeedPosts;
  const HorizontallyScrollableListOfNewsFeedCards({super.key, required this.listOfNewsFeedPosts});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(10),

    child: Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Breaking news",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              Text("See more",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  color: AppColors.darkGreen1
                ),),
            ],
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                listOfNewsFeedPosts.map((post) => NewsFeedCard(newsFeedPost: post)).toList(),
            ),
          ),
        ],
      ),),
    );
  }
}
