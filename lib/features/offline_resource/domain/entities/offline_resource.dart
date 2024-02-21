// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'step.dart';
part "offline_resource.g.dart";

@HiveType(typeId: 0)
class OfflineResource {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String generalIntro;
  @HiveField(3)
  List<Step> steps;
  @HiveField(4)
  String summary;

  OfflineResource({
    required this.id,
    required this.title,
    required this.generalIntro,
    required this.steps,
    required this.summary,
  });

  Map<String, dynamic> toMapForFirebase() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'generalIntro': generalIntro,
      'steps': steps.map((x) => x.toMapForFirebase()).toList(),
      'summary': summary,
    };
  }

  factory OfflineResource.fromMapForFirebase(Map<String, dynamic> map) {
    return OfflineResource(
      id: map['id'] as String,
      title: map['title'] as String,
      generalIntro: map['generalIntro'] as String,
      steps: List<Step>.from(
        (map['steps'] as List<dynamic>).map<Step>(
          (x) => Step.fromMapForFirebase(x as Map<String, dynamic>),
        ),
      ),
      summary: map['summary'] as String,
    );
  }
}
