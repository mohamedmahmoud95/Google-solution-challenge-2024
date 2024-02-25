// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'offline_resource_step.dart';

part "offline_resource.g.dart";

@HiveType(typeId: 0)
class OfflineResource {
  @HiveField(0)
  String id;
  @HiveField(1)
  String imageUrl;
  @HiveField(2)
  String title;
  @HiveField(3)
  String generalIntro;
  @HiveField(4)
  List<OfflineResourceStep> offlineResourceSteps;
  @HiveField(5)
  String summary;
  OfflineResource({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.generalIntro,
    required this.offlineResourceSteps,
    required this.summary,
  });


  Map<String, dynamic> toMapForFirebase() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'generalIntro': generalIntro,
      'offlineResourceSteps': offlineResourceSteps.map((x) => x.toMapForFirebase()).toList(),
      'summary': summary,
    };
  }

  factory OfflineResource.fromMapForFirebase(Map<String, dynamic> map) {
    return OfflineResource(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      generalIntro: map['generalIntro'] as String,
      offlineResourceSteps: List<OfflineResourceStep>.from((map['offlineResourceSteps'] as List<int>).map<OfflineResourceStep>((x) => OfflineResourceStep.fromMapForFirebase(x as Map<String,dynamic>),),),
      summary: map['summary'] as String,
    );
  }
  @override
  String toString() {
    return 'OfflineResource(id: $id, imageUrl: $imageUrl, title: $title, generalIntro: $generalIntro, offlineResourceSteps: $offlineResourceSteps, summary: $summary)';
  }

  @override
  bool operator ==(covariant OfflineResource other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.imageUrl == imageUrl &&
      other.title == title &&
      other.generalIntro == generalIntro &&
      listEquals(other.offlineResourceSteps, offlineResourceSteps) &&
      other.summary == summary;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      imageUrl.hashCode ^
      title.hashCode ^
      generalIntro.hashCode ^
      offlineResourceSteps.hashCode ^
      summary.hashCode;
  }
}
