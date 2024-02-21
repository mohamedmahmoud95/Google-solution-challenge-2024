// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeneralDataAdapter extends TypeAdapter<GeneralData> {
  @override
  final int typeId = 2;

  @override
  GeneralData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeneralData(
      appVersion: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeneralData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.appVersion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
