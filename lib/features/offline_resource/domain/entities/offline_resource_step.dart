// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part "offline_resource_step.g.dart";

@HiveType(typeId: 1)
class OfflineResourceStep {
  @HiveField(0)
  String id;
  @HiveField(1)
  String index;
  @HiveField(2)
  String title;
  @HiveField(3)
  String imageLink;
  @HiveField(4)
  String bodyText;
  OfflineResourceStep({
    required this.id,
    required this.index,
    required this.title,
    required this.imageLink,
    required this.bodyText,
  });

  OfflineResourceStep copyWith({
    String? id,
    String? index,
    String? title,
    String? imageLink,
    String? bodyText,
  }) {
    return OfflineResourceStep(
      id: id ?? this.id,
      index: index ?? this.index,
      title: title ?? this.title,
      imageLink: imageLink ?? this.imageLink,
      bodyText: bodyText ?? this.bodyText,
    );
  }

  Map<String, dynamic> toMapForFirebase() {
    return <String, dynamic>{
      'id': id,
      'index': index,
      'title': title,
      'imageLink': imageLink,
      'bodyText': bodyText,
    };
  }

  factory OfflineResourceStep.fromMapForFirebase(Map<String, dynamic> map) {
    return OfflineResourceStep(
      id: map['id'] as String,
      index: map['index'] as String,
      title: map['title'] as String,
      imageLink: map['imageLink'] as String,
      bodyText: map['bodyText'] as String,
    );
  }


  @override
  String toString() {
    return 'OfflineResourceStep(id: $id, index: $index, title: $title, imageLink: $imageLink, bodyText: $bodyText)';
  }

  @override
  bool operator ==(covariant OfflineResourceStep other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.index == index &&
      other.title == title &&
      other.imageLink == imageLink &&
      other.bodyText == bodyText;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      index.hashCode ^
      title.hashCode ^
      imageLink.hashCode ^
      bodyText.hashCode;
  }
}
