import 'package:hive/hive.dart';
part "step.g.dart";

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
}
