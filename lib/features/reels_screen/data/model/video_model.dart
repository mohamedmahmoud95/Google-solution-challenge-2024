class VideoModel {
  String name;
  String mediaUrl;
  String thumbnail;
  int commentNum;
  int shareNum;
  int reactNum;

  VideoModel({
    required this.reactNum,
    required this.shareNum,
    required this.commentNum,
    required this.name,
    required this.mediaUrl,
    required this.thumbnail,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      name: json['name'],
      mediaUrl: json['mediaUrl'],
      thumbnail: json['thumbnail'],
      reactNum: json['reactNum'],
      shareNum: json['shareNum'],
      commentNum: json['commentNum'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['mediaUrl'] = mediaUrl;
    data['thumbnail'] = thumbnail;
    data['shareNum'] = shareNum;
    data['reactNum'] = reactNum;
    data['commentNum'] = commentNum;
    return data;
  }
}
