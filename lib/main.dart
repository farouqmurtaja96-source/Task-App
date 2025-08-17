import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_v1/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddTaskCubit()),
        BlocProvider(create: (context) => GetTaskCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
