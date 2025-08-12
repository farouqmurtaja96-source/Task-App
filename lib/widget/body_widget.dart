import 'package:flutter/material.dart';
import 'package:task_v1/widget/new_task_widget.dart';
import 'package:task_v1/widget/no_task_widget.dart';

class BodyContentWidget extends StatelessWidget {
  const BodyContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: NewTaskWidget());
  }
}
