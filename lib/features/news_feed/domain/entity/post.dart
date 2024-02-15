class NewsSource {
  String? id;
  String? websiteUrl;
  String? name;
  String? logoUrl;
  NewsSource({
    this.name,
    this.id,
    this.logoUrl,
    this.websiteUrl,
});
}

class NewsFeedPost {
  String? id;
  String? title;
  String content;
  DateTime createdAt;
  String authorId;
  String? imageUrl;
  int numOfUpVotes;
  int numOfDownVotes;
  NewsSource? newsSource;

  NewsFeedPost({
    this.id,
    this.imageUrl,
    this.title,
    required this.authorId,
    required this.content,
    required this.createdAt,
    required this.numOfDownVotes,
    required this.numOfUpVotes,
    this.newsSource,
  });

}