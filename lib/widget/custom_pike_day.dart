import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';

class CustomPikeDay extends StatelessWidget {
  const CustomPikeDay({super.key, this.onDateChange});
  final Function(DateTime)? onDateChange;

  @override
  Widget build(BuildContext context) {
    DateTime firstDate =
        BlocProvider.of<GetTaskCubit>(context).tasks!.isNotEmpty
        ? DateFormat(
            "M/d/yyyy",
          ).parse(BlocProvider.of<GetTaskCubit>(context).tasks!.first.date)
        : DateTime.now();
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: DatePicker(
        firstDate,
        onDateChange: onDateChange,
        initialSelectedDate: DateTime.now(),
        width: 85,
        height: 120,
        selectionColor: Colors.blueAccent,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
