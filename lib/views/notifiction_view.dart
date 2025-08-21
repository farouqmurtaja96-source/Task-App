import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';

class NotifictionView extends StatelessWidget {
  final String? respons;

  const NotifictionView({Key? key, this.respons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? taskId = int.tryParse(respons ?? ""); // حوّل النص لـ int

    // مثال: تجيب التاسك من الكيوبت
    final task = context.read<GetTaskCubit>().tasks!.firstWhere(
      (t) => t.id == taskId,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Notification Task")),
      body: task == null
          ? Center(child: Text("Task not found"))
          : Padding(
              padding: const EdgeInsets.only(right: 24.0, left: 24, top: 24),
              child: Container(
                height: 850,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Title: ${task.title}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      Text("Note: ${task.note}"),
                      SizedBox(height: 30),
                      Text("Date: ${task.date} - ${task.satrtTime}"),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
