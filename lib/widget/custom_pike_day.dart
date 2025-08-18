import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class CustomPikeDay extends StatelessWidget {
  const CustomPikeDay({super.key, this.onDateChange});
  final Function(DateTime)? onDateChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: DatePicker(
        onDateChange: onDateChange,
        initialSelectedDate: DateTime.now(),
        DateTime.now(),
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
