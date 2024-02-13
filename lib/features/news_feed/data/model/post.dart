class Post {
  String? id;
  String? title;
  String content;
  DateTime createdAt;
  String authorId;
  String? imageUrl;
  int numOfUpVotes;
  int numOfDownVotes;

  Post({
    this.id,
    this.imageUrl,
    this.title,
    required this.authorId,
    required this.content,
    required this.createdAt,
    required this.numOfDownVotes,
    required this.numOfUpVotes
  });

}