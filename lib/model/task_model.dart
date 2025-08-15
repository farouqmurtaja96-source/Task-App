import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String note;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String satrtTime;
  @HiveField(4)
  final String endTime;
  @HiveField(5)
  final int color;

  TaskModel({
    required this.title,
    required this.note,
    required this.date,
    required this.satrtTime,
    required this.endTime,
    required this.color,
  });
}
