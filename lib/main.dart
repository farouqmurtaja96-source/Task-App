import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_v1/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/cubit/theme_cubit/them_cubit_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/services/notification.dart';
import 'package:task_v1/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotification.inti();
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
        BlocProvider(create: (context) => ThemCubit()),
      ],
      child: BlocBuilder<ThemCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state,
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        },
      ),
    );
  }
}
