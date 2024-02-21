// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepAdapter extends TypeAdapter<OfflineResourceStep> {
  @override
  final int typeId = 1;

  @override
  OfflineResourceStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineResourceStep(
      id: fields[0] as String,
      index: fields[1] as String,
      title: fields[2] as String,
      imageLink: fields[3] as String,
      bodyText: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OfflineResourceStep obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.index)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.imageLink)
      ..writeByte(4)
      ..write(obj.bodyText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
