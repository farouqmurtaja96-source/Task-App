import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
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
    BlocProvider.of<GetTaskCubit>(context).getTask();
    super.initState();
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
            AppBarWidget(icon: Icons.dark_mode),
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
