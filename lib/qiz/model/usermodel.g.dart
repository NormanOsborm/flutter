// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserScoreAdapter extends TypeAdapter<UserScore> {
  @override
  final int typeId = 0;

  @override
  UserScore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserScore(
      userName: fields[0] as String,
      level1Score: fields[1] as int,
      level2Score: fields[2] as int,
      level3Score: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserScore obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.level1Score)
      ..writeByte(2)
      ..write(obj.level2Score)
      ..writeByte(3)
      ..write(obj.level3Score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserScoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
