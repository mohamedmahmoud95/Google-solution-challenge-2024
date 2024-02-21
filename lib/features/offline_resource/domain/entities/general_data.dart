// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part "general_data.g.dart";

@HiveType(typeId: 2)
class GeneralData {
  
    @HiveField(0)
  final String appVersion;
  GeneralData({
    required this.appVersion,
  });

  GeneralData copyWith({
    String? appVersion,
  }) {
    return GeneralData(
      appVersion: appVersion ?? this.appVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appVersion': appVersion,
    };
  }
  factory GeneralData.fromMap(Map<String, dynamic> map) {
    return GeneralData(
      appVersion: map['appVersion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralData.fromJson(String source) => GeneralData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeneralData(appVersion: $appVersion)';

  @override
  bool operator ==(covariant GeneralData other) {
    if (identical(this, other)) return true;
  
    return 
      other.appVersion == appVersion;
  }

  @override
  int get hashCode => appVersion.hashCode;
}
