import 'package:easy_localization/easy_localization.dart';
import 'package:google_solution_challenge_2024/features/news_feed/domain/entity/post.dart';
import 'package:google_solution_challenge_2024/features/news_feed/sampleStaticData/sampleNewsSources.dart';

NewsFeedPost sampleNewsFeedPost1 = NewsFeedPost(
    authorId: '123',
    content:
        "Egyptian food and medicine aid convoys arrive in Rafah tomorrow".tr(),
    createdAt: DateTime.now(),
    numOfDownVotes: 10,
    numOfUpVotes: 0,
    imageUrl: 'https://img.youm7.com/large/20231017094503453.jpg',
    newsSource: jazeera,

);

List<NewsFeedPost> sampleNewsFeedPosts = [
  sampleNewsFeedPost1,
  sampleNewsFeedPost1,
  sampleNewsFeedPost1
];
