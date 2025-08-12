import 'package:flutter/material.dart';
import 'package:task_v1/widget/app_bar_widget.dart';
import 'package:task_v1/widget/body_widget.dart';
import 'package:task_v1/widget/custom_pike_day.dart';
import 'package:task_v1/widget/custom_tittle_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            CustomPikeDay(),
            BodyContentWidget(),
          ],
        ),
      ),
    );
  }
}
