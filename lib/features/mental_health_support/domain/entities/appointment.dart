// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

enum Status { upcoming, completed, canceled }

class Appointment {
  String id;
  String professionalId;
  String userId;
  DateTime dateTime;
  Status status;
  String videoCallLink;
  Appointment({
    required this.id,
    required this.professionalId,
    required this.userId,
    required this.dateTime,
    required this.status,
    required this.videoCallLink,
  });

  Appointment copyWith({
    String? id,
    String? professionalId,
    String? userId,
    DateTime? dateTime,
    Status? status,
    String? videoCallLink,
  }) {
    return Appointment(
      id: id ?? this.id,
      professionalId: professionalId ?? this.professionalId,
      userId: userId ?? this.userId,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      videoCallLink: videoCallLink ?? this.videoCallLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'professionalId': professionalId,
      'userId': userId,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'status': status.index,
      'videoCallLink': videoCallLink,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'] as String,
      professionalId: map['professionalId'] as String,
      userId: map['userId'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      status: Status.values[map[map['status'] as int]],
      videoCallLink: map['videoCallLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Appointment(id: $id, professionalId: $professionalId, userId: $userId, dateTime: $dateTime, status: $status, videoCallLink: $videoCallLink)';
  }

  @override
  bool operator ==(covariant Appointment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.professionalId == professionalId &&
        other.userId == userId &&
        other.dateTime == dateTime &&
        other.status == status &&
        other.videoCallLink == videoCallLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        professionalId.hashCode ^
        userId.hashCode ^
        dateTime.hashCode ^
        status.hashCode ^
        videoCallLink.hashCode;
  }
}
