// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      title: fields[0] as String,
      note: fields[1] as String,
      date: fields[2] as String,
      satrtTime: fields[3] as String,
      endTime: fields[4] as String,
      color: fields[5] as int,
      id: fields[6] as int?,
      isCompelet: fields[7] as bool?,
      repeat: fields[8] as String?,
      remind: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.satrtTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.isCompelet)
      ..writeByte(8)
      ..write(obj.repeat)
      ..writeByte(9)
      ..write(obj.remind);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
