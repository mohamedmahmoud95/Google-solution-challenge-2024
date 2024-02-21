// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'open_close_time.dart';

class Group {
  final String id;
  final String title;
  final String mentorID;
  final List<String> allAppointeesIds;
  final String photoUrl;
  final double rating;
  final List<OpenCloseTime> timeOfSlotes;
  final int maximumAppointees;
  Group({
    required this.id,
    required this.title,
    required this.mentorID,
    required this.allAppointeesIds,
    required this.photoUrl,
    required this.rating,
    required this.timeOfSlotes,
    required this.maximumAppointees
  });

  Group copyWith({
    String? id,
    String? title,
    String? mentorID,
    List<String>? allAppointeesIds,
    String? photoUrl,
    double? rating,
    List<OpenCloseTime>? timeOfSlotes,
    int? maximumAppointees,
  }) {
    return Group(
      id: id ?? this.id,
      title: title ?? this.title,
      mentorID: mentorID ?? this.mentorID,
      allAppointeesIds: allAppointeesIds ?? this.allAppointeesIds,
      photoUrl: photoUrl ?? this.photoUrl,
      rating: rating ?? this.rating,
      timeOfSlotes: timeOfSlotes ?? this.timeOfSlotes,
      maximumAppointees: maximumAppointees ?? this.maximumAppointees,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'mentorID': mentorID,
      'allAppointeesIds': allAppointeesIds,
      'photoUrl': photoUrl,
      'rating': rating,
      'timeOfSlotes': timeOfSlotes.map((x) => x.toMap()).toList(),
      'maximumAppointees': maximumAppointees,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] as String,
      title: map['title'] as String,
      mentorID: map['mentorID'] as String,
      allAppointeesIds: List<String>.from((map['allAppointeesIds'] as List<dynamic>)),
      photoUrl: map['photoUrl'] as String,
      rating: map['rating'] as double,
      timeOfSlotes: List<OpenCloseTime>.from((map['timeOfSlotes'] as List<dynamic>).map<OpenCloseTime>((x) => OpenCloseTime.fromMap(x as Map<String,dynamic>),),),
      maximumAppointees: map['maximumAppointees'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Group.fromJson(String source) => Group.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Group(id: $id, title: $title, mentorID: $mentorID, allAppointeesIds: $allAppointeesIds, photoUrl: $photoUrl, rating: $rating, timeOfSlotes: $timeOfSlotes, maximumAppointees: $maximumAppointees)';
  }

  @override
  bool operator ==(covariant Group other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.mentorID == mentorID &&
      listEquals(other.allAppointeesIds, allAppointeesIds) &&
      other.photoUrl == photoUrl &&
      other.rating == rating &&
      listEquals(other.timeOfSlotes, timeOfSlotes) &&
      other.maximumAppointees == maximumAppointees;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      mentorID.hashCode ^
      allAppointeesIds.hashCode ^
      photoUrl.hashCode ^
      rating.hashCode ^
      timeOfSlotes.hashCode ^
      maximumAppointees.hashCode;
  }
}
