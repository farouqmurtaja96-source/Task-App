import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_v1/views/add_task_view.dart';
import 'package:task_v1/widget/custom_button_widget.dart';

class CustomTittleWidget extends StatelessWidget {
  const CustomTittleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),

            Text(
              'Today',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        CustomButtonWidget(
          name: '+Add Task',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddTaskView();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
