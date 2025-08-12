import 'package:flutter/material.dart';
import 'package:task_v1/widget/app_bar_widget.dart';
import 'package:task_v1/widget/custom_button_widget.dart';
import 'package:task_v1/widget/custom_text_feild.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            AppBarWidget(
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 5),
            Text(
              'Add Task',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            CustomTextFeild(title: 'Title', hint: 'Add your Task'),
            SizedBox(height: 15),
            CustomTextFeild(title: 'Note', hint: 'Add your Note'),
            SizedBox(height: 15),
            CustomTextFeild(
              title: 'Date',
              hint: 'Enter the date',
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.calendar_month),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomTextFeild(
                    title: 'Satrt time',
                    hint: 'hint',
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextFeild(
                    title: 'End time',
                    hint: 'hint',
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_time),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFeild(title: 'Remind', hint: 'hint'),
            SizedBox(height: 10),
            CustomTextFeild(title: 'Repeat', hint: 'hint'),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CircleAvatar(radius: 16, backgroundColor: Colors.blue),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color.fromARGB(
                            255,
                            33,
                            243,
                            226,
                          ),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color.fromARGB(
                            255,
                            243,
                            33,
                            243,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomButtonWidget(name: 'Create Task'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
