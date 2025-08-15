import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_v1/widget/app_bar_widget.dart';
import 'package:task_v1/widget/custom_button_widget.dart';
import 'package:task_v1/widget/custom_text_feild.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  String? date, startTime, endTime, remidenValue, repat;
  final List<String> remindOptions = [
    "10 minutes ",
    "15 minutes",
    "20 minutes",
    "25 minutes",
  ];
  final List<String> repatOptions = ["1 ", "2", "3", "4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
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
              isRead: true,
              title: 'Date',
              hint: date ?? DateFormat.yMd().format(DateTime.now()),
              icon: Icon(Icons.calendar_month),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2025),
                  lastDate: DateTime(2030),
                );
                if (pickedDate != null) {
                  setState(() {
                    date = DateFormat.yMd().format(pickedDate);
                  });
                }
              },
            ),

            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomTextFeild(
                    isRead: true,
                    onTap: () async {
                      final TimeOfDay? pickerTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickerTime != null) {
                        setState(() {
                          startTime = pickerTime.format(context);
                        });
                      }
                    },
                    title: 'Satrt time',
                    hint: startTime ?? TimeOfDay.now().format(context),
                    icon: Icon(Icons.access_time),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextFeild(
                    isRead: true,
                    onTap: () async {
                      final TimeOfDay? pickerTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickerTime != null) {
                        setState(() {
                          endTime = pickerTime.format(context);
                        });
                      }
                    },
                    title: 'End time',
                    hint: endTime ?? TimeOfDay.now().format(context),
                    icon: Icon(Icons.access_time),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFeild(
              isRead: true,
              title: 'Remind',
              hint: remidenValue ?? 'Remind',
              icon: DropdownButton<String>(
                underline: Container(height: 0),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: remindOptions.map((option) {
                  return DropdownMenuItem(value: option, child: Text(option));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    remidenValue = value;
                  });
                },
              ),
            ),

            SizedBox(height: 10),

            CustomTextFeild(
              isRead: true,
              icon: DropdownButton(
                underline: Container(height: 0),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: repatOptions.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    repat = value;
                  });
                },
              ),
              title: 'Repeat',
              hint: repat ?? 'Repeat',
            ),
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
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ColorList(),
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

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _LastSeactionState();
}

class _LastSeactionState extends State<ColorList> {
  List color = [
    Colors.blue,
    Color.fromARGB(255, 33, 243, 226),
    Color.fromARGB(255, 243, 33, 243),
  ];
  int isActive = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: color.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isActive = index; // تحديث اللون النشط
              });
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: color[index],
              child: isActive == index
                  ? const Icon(Icons.check, color: Colors.white, size: 24)
                  : null,
            ),
          ),
        );
      },
    );
  }
}














// final value = showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return ListView(
//                       children: [
//                         ListTile(
//                           title: const Text("10 دقائق قبل"),
//                           onTap: () => Navigator.pop(context, "10 دقائق قبل"),
//                         ),
//                         ListTile(
//                           title: const Text("15 دقائق قبل"),
//                           onTap: () => Navigator.pop(context, "15 دقائق قبل"),
//                         ),
//                         ListTile(
//                           title: const Text("20 دقائق قبل"),
//                           onTap: () => Navigator.pop(context, "20 دقائق قبل"),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 if (value != null) {
//                   remidenValue = value.toString();
//                 }






// CustomTextFeild(
            //   isRead: true,
            //   title: 'Remind',
            //   hint: remidenValue ?? 'Remind',
            //   icon: const Icon(Icons.keyboard_arrow_down),
            //   onTap: () async {
            //     final RenderBox textFieldBox =
            //         context.findRenderObject() as RenderBox;
            //     final Offset offset = textFieldBox.localToGlobal(Offset.zero);
            //     final selected = await showMenu<String>(
            //       context: context,
            //       position: RelativeRect.fromLTRB(
            //         offset.dx,
            //         offset.dy + textFieldBox.size.height,
            //         offset.dx + textFieldBox.size.width,
            //         offset.dy,
            //       ),
            //       items: remindOptions.map((option) {
            //         return PopupMenuItem(value: option, child: Text(option));
            //       }).toList(),
            //     );
            //     if (selected != null) {
            //       setState(() {
            //         remidenValue = selected;
            //       });
            //     }
            //   },
            // ),