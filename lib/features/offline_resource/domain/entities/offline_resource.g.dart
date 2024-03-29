// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_resource.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfflineResourceAdapter extends TypeAdapter<OfflineResource> {
  @override
  final int typeId = 0;

  @override
  OfflineResource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineResource(
      id: fields[0] as String,
      imageUrl: fields[1] as String,
      title: fields[2] as String,
      generalIntro: fields[3] as String,
      offlineResourceSteps: (fields[4] as List).cast<OfflineResourceStep>(),
      summary: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OfflineResource obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.generalIntro)
      ..writeByte(4)
      ..write(obj.offlineResourceSteps)
      ..writeByte(5)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfflineResourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
