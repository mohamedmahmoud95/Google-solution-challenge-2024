import 'package:flutter/material.dart';

class OpenCloseTime {
  final String id;
  final TimeOfDay openTime;
  final TimeOfDay closeTime;

  OpenCloseTime({
    required this.id,
    required this.openTime,
    required this.closeTime,
  });

  factory OpenCloseTime.fromMap(Map<String, dynamic> map) {
    return OpenCloseTime(
      id: map["id"],
      openTime: TimeOfDay(
        hour: map['openTime']['hour'],
        minute: map['openTime']['minute'],
      ),
      closeTime: TimeOfDay(
        hour: map['closeTime']['hour'],
        minute: map['closeTime']['minute'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'openTime': {
        'hour': openTime.hour,
        'minute': openTime.minute,
      },
      'closeTime': {
        'hour': closeTime.hour,
        'minute': closeTime.minute,
      },
    };
  }
}
