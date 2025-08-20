import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/services/notification.dart';

import 'package:task_v1/views/notifiction_view.dart';
import 'package:task_v1/widget/app_bar_widget.dart';
import 'package:task_v1/widget/body_widget.dart';
import 'package:task_v1/widget/custom_pike_day.dart';
import 'package:task_v1/widget/custom_tittle_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetTaskCubit>(context).getTask();
    listen();
  }

  void listen() {
    LocalNotification.streamController.stream.listen((notificrionRespons) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return NotifictionView(respons: notificrionRespons.payload);
          },
        ),
      );
    });
  }

  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            AppBarWidget(icon: Icons.dark_mode, onPressed: () {}),
            CustomTittleWidget(),
            SizedBox(height: 10),
            CustomPikeDay(
              onDateChange: (value) {
                setState(() {
                  selectDate = value;
                });
              },
            ),

            BodyContentWidget(selectDate: selectDate),
          ],
        ),
      ),
    );
  }
}
