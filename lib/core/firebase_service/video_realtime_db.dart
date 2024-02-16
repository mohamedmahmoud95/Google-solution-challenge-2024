import 'package:firebase_database/firebase_database.dart';

class VideoRealTimeDB {
  // ignore: deprecated_member_use
  static FirebaseDatabase firebaseDatabase = FirebaseDatabase();
  static addVideoToRealTime() async {
    await firebaseDatabase.ref("videos").push().set(VideoModel(
            reactNum: 5,
            shareNum: 5,
            commentNum: 5,
            name: "some name",
            mediaUrl: "mediaUrl",
            thumbnail: "thumbnail")
        .toJson());
  }
}

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
