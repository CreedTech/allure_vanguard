// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoast_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YoastTableAdapter extends TypeAdapter<YoastTable> {
  @override
  final int typeId = 1;

  @override
  YoastTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YoastTable(
      ogTitle: fields[0] as String,
      ogDescription: fields[1] as String,
      author: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, YoastTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ogTitle)
      ..writeByte(1)
      ..write(obj.ogDescription)
      ..writeByte(2)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YoastTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
