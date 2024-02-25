// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CharityInstitute {
  String name;
  String mission;
  String imageUrl;
  List<String> supportedCauses;
  double fundsRaised;
  CharityInstitute({
    required this.name,
    required this.mission,
    required this.imageUrl,
    required this.supportedCauses,
    required this.fundsRaised,
  });

  CharityInstitute copyWith({
    String? name,
    String? mission,
    String? imageUrl,
    List<String>? supportedCauses,
    double? fundsRaised,
  }) {
    return CharityInstitute(
      name: name ?? this.name,
      mission: mission ?? this.mission,
      imageUrl: imageUrl ?? this.imageUrl,
      supportedCauses: supportedCauses ?? this.supportedCauses,
      fundsRaised: fundsRaised ?? this.fundsRaised,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mission': mission,
      'imageUrl': imageUrl,
      'supportedCauses': supportedCauses,
      'fundsRaised': fundsRaised,
    };
  }

  factory CharityInstitute.fromMap(Map<String, dynamic> map) {
    return CharityInstitute(
      name: map['name'] as String,
      mission: map['mission'] as String,
      imageUrl: map['imageUrl'] as String,
      supportedCauses:
          List<String>.from((map['supportedCauses'] as List<dynamic>)),
      fundsRaised: map['fundsRaised'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharityInstitute.fromJson(String source) =>
      CharityInstitute.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CharityInstitute(name: $name, mission: $mission, imageUrl: $imageUrl, supportedCauses: $supportedCauses, fundsRaised: $fundsRaised)';
  }

  @override
  bool operator ==(covariant CharityInstitute other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.mission == mission &&
        other.imageUrl == imageUrl &&
        listEquals(other.supportedCauses, supportedCauses) &&
        other.fundsRaised == fundsRaised;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        mission.hashCode ^
        imageUrl.hashCode ^
        supportedCauses.hashCode ^
        fundsRaised.hashCode;
  }
}
