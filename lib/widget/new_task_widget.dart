import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/views/edit_task.dart';
import 'package:task_v1/widget/itme_widget.dart';
import 'package:task_v1/widget/show_modal_buttom.dart';

class NewTaskWidget extends StatelessWidget {
  const NewTaskWidget({super.key, required this.task});
  final List<TaskModel> task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: task.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(task[index].id ?? index),
              direction: DismissDirection.horizontal,
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  task[index].delete();
                  task.removeAt(index);
                  BlocProvider.of<GetTaskCubit>(context).getTask();
                } else if (direction == DismissDirection.startToEnd) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EidtTaskView(task: task[index]);
                      },
                    ),
                  );
                }
              },
              background: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.edit, color: Colors.white),
                ),
              ),
              secondaryBackground: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  key: ValueKey(task[index].id ?? index), // مهم للتمييز
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ShowModalButtom(task: task[index]);
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(task[index].color),
                    ),
                    child: ItmeWidget(task: task[index]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
