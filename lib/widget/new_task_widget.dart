import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/views/edit_task.dart';

class NewTaskWidget extends StatelessWidget {
  const NewTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        List<TaskModel> task =
            BlocProvider.of<GetTaskCubit>(context).tasks ?? [];
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
                  // Handle end to start swipe if needed
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(task[index].color),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task[index].title,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.timer, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text(
                                    task[index].satrtTime,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '-${task[index].endTime}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                task[index].note,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(width: 1.5, color: Colors.black, height: 60),

                        SizedBox(width: 8),

                        // النص العمودي
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'DONE',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
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
