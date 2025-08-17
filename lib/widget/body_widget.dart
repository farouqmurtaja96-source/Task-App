import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/widget/new_task_widget.dart';

class BodyContentWidget extends StatefulWidget {
  const BodyContentWidget({super.key});
  @override
  State<BodyContentWidget> createState() => _BodyContentWidgetState();
}

class _BodyContentWidgetState extends State<BodyContentWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        BlocProvider.of<GetTaskCubit>(context).getTask();
        return Expanded(child: NewTaskWidget());
      },
    );
  }
}
