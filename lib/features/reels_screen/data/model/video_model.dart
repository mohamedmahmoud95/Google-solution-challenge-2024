class VideoModel {
  String name;
  String mediaUrl;
  String thumbnail;
  int commentNum;
  int shareNum;
  int reactNum;
  int viewsNum;

  VideoModel({
    required this.reactNum,
    required this.shareNum,
    required this.commentNum,
    required this.name,
    required this.mediaUrl,
    required this.thumbnail,
    required this.viewsNum,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      name: json['name'],
      mediaUrl: json['mediaUrl'],
      thumbnail: json['thumbnail'],
      reactNum: json['reactNum'],
      shareNum: json['shareNum'],
      commentNum: json['commentNum'],
      viewsNum: json['viewsNum'],
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
    data['viewsNum'] = viewsNum;
    return data;
  }
}
