// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'open_close_time.dart';

class Professional {
  final String id;
  final String name;
  final String photoUrl;
  final String jobTitle;
  final double rating;
  final List<OpenCloseTime> timeOfSlotes;
  final bool isAvailable;
  final String phoneNumber;
  final List<String> allAppointeesIds;
  Professional({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.jobTitle,
    required this.rating,
    required this.timeOfSlotes,
    required this.isAvailable,
    required this.phoneNumber,
    required this.allAppointeesIds,
  });

  Professional copyWith({
    String? id,
    String? name,
    String? photoUrl,
    String? jobTitle,
    double? rating,
    List<OpenCloseTime>? timeOfSlotes,
    bool? isAvailable,
    String? phoneNumber,
    List<String>? allAppointeesIds,
  }) {
    return Professional(
      id: id ?? this.id,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      jobTitle: jobTitle ?? this.jobTitle,
      rating: rating ?? this.rating,
      timeOfSlotes: timeOfSlotes ?? this.timeOfSlotes,
      isAvailable: isAvailable ?? this.isAvailable,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      allAppointeesIds: allAppointeesIds ?? this.allAppointeesIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'jobTitle': jobTitle,
      'rating': rating,
      'timeOfSlotes': timeOfSlotes.map((x) => x.toMap()).toList(),
      'isAvailable': isAvailable,
      'phoneNumber': phoneNumber,
      'allAppointeesIds': allAppointeesIds,
    };
  }

  factory Professional.fromMap(Map<String, dynamic> map) {
    return Professional(
      id: map['id'] as String,
      name: map['name'] as String,
      photoUrl: map['photoUrl'] as String,
      jobTitle: map['jobTitle'] as String,
      rating: map['rating'] as double,
      timeOfSlotes: (map['timeOfSlotes'] != null)
          ? List<OpenCloseTime>.from(
        (map['timeOfSlotes'] as List<dynamic>).map<OpenCloseTime>(
              (x) => OpenCloseTime.fromMap(x as Map<String, dynamic>),
        ),
      )
          : [],
      isAvailable: map['isAvailable'] as bool,
      phoneNumber: map['phoneNumber'] as String,
      allAppointeesIds: (map['allAppointeesIds'] != null)
          ? List<String>.from(map['allAppointeesIds'] as List<dynamic>)
          : [],
    );
  }


  String toJson() => json.encode(toMap());

  factory Professional.fromJson(String source) =>
      Professional.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Professional(id: $id, name: $name, photoUrl: $photoUrl, jobTitle: $jobTitle, rating: $rating, timeOfSlotes: $timeOfSlotes, isAvailable: $isAvailable, phoneNumber: $phoneNumber, allAppointeesIds: $allAppointeesIds)';
  }

  @override
  bool operator ==(covariant Professional other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.photoUrl == photoUrl &&
        other.jobTitle == jobTitle &&
        other.rating == rating &&
        listEquals(other.timeOfSlotes, timeOfSlotes) &&
        other.isAvailable == isAvailable &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.allAppointeesIds, allAppointeesIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        photoUrl.hashCode ^
        jobTitle.hashCode ^
        rating.hashCode ^
        timeOfSlotes.hashCode ^
        isAvailable.hashCode ^
        phoneNumber.hashCode ^
        allAppointeesIds.hashCode;
  }
}
