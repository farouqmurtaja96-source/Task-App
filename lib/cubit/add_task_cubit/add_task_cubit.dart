import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/services/notification.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  Color color = Color.fromARGB(255, 33, 159, 243);

  addTask(TaskModel task) async {
    task.color = color.toARGB32();
    try {
      var data = await Hive.box<TaskModel>('tasks');
      data.add(task);

      emit(AddTaskSucces());
    } catch (e) {
      emit(AddTaskfailuer(errormessge: e.toString()));
    }
  }

  showNotifiction({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) {
    LocalNotification.ShowNotifiction(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      payload: payload,
    );
  }
}
