import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/widget/new_task_widget.dart';
import 'package:task_v1/widget/no_task_widget.dart';

class BodyContentWidget extends StatelessWidget {
  const BodyContentWidget({super.key, required this.selectDate});
  final DateTime selectDate;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        List<TaskModel> task =
            BlocProvider.of<GetTaskCubit>(context).tasks ?? [];
        final filteredTasks = task.where((task) {
          final taskDate = DateFormat.yMd().parse(task.date);
          final select = selectDate;
          if (task.repeat == 'Daily') {
            return true;
          } else if (task.repeat == 'Monthly') {
            return taskDate.day == select.day;
          } else if (task.repeat == 'Yearly') {
            return taskDate.day == select.day && select.month == select.month;
          } else {
            return task.date == DateFormat.yMd().format(selectDate);
          }
        }).toList();
        return filteredTasks.isEmpty
            ? Expanded(child: NoTaskWidget())
            : Expanded(child: NewTaskWidget(task: filteredTasks));
      },
    );
  }
}
