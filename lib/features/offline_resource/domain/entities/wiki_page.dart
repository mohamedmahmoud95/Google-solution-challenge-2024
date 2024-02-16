// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class WikiPage {
  String id;
  String title;
  String generalIntro;
  List<WikiStep> steps;
  String summary;
  WikiPage({
    required this.id,
    required this.title,
    required this.generalIntro,
    required this.steps,
    required this.summary,
  });

  WikiPage copyWith({
    String? id,
    String? title,
    String? generalIntro,
    List<WikiStep>? steps,
    String? summary,
  }) {
    return WikiPage(
      id: id ?? this.id,
      title: title ?? this.title,
      generalIntro: generalIntro ?? this.generalIntro,
      steps: steps ?? this.steps,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'generalIntro': generalIntro,
      'steps': steps.map((x) => x.toMap()).toList(),
      'summary': summary,
    };
  }

  factory WikiPage.fromMap(Map<String, dynamic> map) {
    return WikiPage(
      id: map['id'] as String,
      title: map['title'] as String,
      generalIntro: map['generalIntro'] as String,
      steps: List<WikiStep>.from(
        (map['steps'] as List<int>).map<WikiStep>(
          (x) => WikiStep.fromMap(x as Map<String, dynamic>),
        ),
      ),
      summary: map['summary'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WikiPage.fromJson(String source) =>
      WikiPage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WikiPage(id: $id, title: $title, generalIntro: $generalIntro, steps: $steps, summary: $summary)';
  }

  @override
  bool operator ==(covariant WikiPage other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.generalIntro == generalIntro &&
        listEquals(other.steps, steps) &&
        other.summary == summary;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        generalIntro.hashCode ^
        steps.hashCode ^
        summary.hashCode;
  }
}

class WikiStep {
  String id;
  String index;
  String title;
  String imageLink;
  String bodyText;
  WikiStep({
    required this.id,
    required this.index,
    required this.title,
    required this.imageLink,
    required this.bodyText,
  });

  WikiStep copyWith({
    String? id,
    String? index,
    String? title,
    String? imageLink,
    String? bodyText,
  }) {
    return WikiStep(
      id: id ?? this.id,
      index: index ?? this.index,
      title: title ?? this.title,
      imageLink: imageLink ?? this.imageLink,
      bodyText: bodyText ?? this.bodyText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'index': index,
      'title': title,
      'imageLink': imageLink,
      'bodyText': bodyText,
    };
  }

  factory WikiStep.fromMap(Map<String, dynamic> map) {
    return WikiStep(
      id: map['id'] as String,
      index: map['index'] as String,
      title: map['title'] as String,
      imageLink: map['imageLink'] as String,
      bodyText: map['bodyText'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WikiStep.fromJson(String source) =>
      WikiStep.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WikiStep(id: $id, index: $index, title: $title, imageLink: $imageLink, bodyText: $bodyText)';
  }

  @override
  bool operator ==(covariant WikiStep other) {
    if (identical(this, other)) return true;

    return other.id == id &&
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
