import 'package:flutter/material.dart';
import 'package:task_v1/model/task_model.dart';

class ItmeWidget extends StatelessWidget {
  const ItmeWidget({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      task.satrtTime,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '-${task.endTime}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  task.note,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.black, height: 60),

          SizedBox(width: 8),

          // النص العمودي
          RotatedBox(
            quarterTurns: 3,
            child: task.isCompelet == true
                ? Text(
                    'Completed',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                : Text(
                    'ToDo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
