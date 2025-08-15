import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:task_v1/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(TaskModel task) async {
    try {
      var data = await Hive.openBox<TaskModel>('tasks');
      data.add(task);
      emit(AddTaskSucces());
    } catch (e) {
      emit(AddTaskfailuer(errormessge: e.toString()));
    }
  }
}
