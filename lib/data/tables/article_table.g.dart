// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleTableAdapter extends TypeAdapter<ArticleTable> {
  @override
  final int typeId = 0;

  @override
  ArticleTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleTable(
      id: fields[0] as int,
      yoastHeadJson: fields[2] as YoastHeadJson?,
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.yoastHeadJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
