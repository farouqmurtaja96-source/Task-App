import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:task_v1/model/task_model.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit() : super(GetTaskInitial());
  List<TaskModel>? tasks = [];
  void getTask() {
    tasks = Hive.box<TaskModel>('tasks').values.toList();
    emit(GetTaskSucce(tasks: tasks!));
  }
}
