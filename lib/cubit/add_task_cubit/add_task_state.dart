part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLodaing extends AddTaskState {}

final class AddTaskSucces extends AddTaskState {}

final class AddTaskfailuer extends AddTaskState {
  final String errormessge;

  AddTaskfailuer({required this.errormessge});
}
