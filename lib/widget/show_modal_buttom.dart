import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_v1/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/widget/custom_button_widget.dart';

class ShowModalButtom extends StatelessWidget {
  const ShowModalButtom({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomButtonWidget(
              onTap: () {
                task.isCompelet = true;
                task.save();
                BlocProvider.of<GetTaskCubit>(context).getTask();
                Navigator.pop(context);
              },
              name: 'Task Completed',
              width: double.infinity,
              color: Colors.indigo,
            ),
            SizedBox(height: 5),
            CustomButtonWidget(
              onTap: () {
                task.delete();
                BlocProvider.of<GetTaskCubit>(context).getTask();
                Navigator.pop(context);
              },
              name: 'Delete Task ',
              width: double.infinity,
              color: Colors.red,
            ),
            SizedBox(height: 35),
            CustomButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              name: 'Close',
              width: double.infinity,
              color: Colors.white,
              textColor: Colors.black,
              borderColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
