import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_v1/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/widget/app_bar_widget.dart';
import 'package:task_v1/widget/color_list.dart';
import 'package:task_v1/widget/custom_button_widget.dart';
import 'package:task_v1/widget/custom_text_feild.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  String? date, startTime, endTime, remidenValue, repat, title, note;
  final List<String> remindOptions = [
    "10 minutes ",
    "15 minutes",
    "20 minutes",
    "25 minutes",
  ];
  final List<String> repatOptions = ["1 ", "2", "3", "4"];
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController controller = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
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
                CustomTextFeild(
                  title: 'Title',
                  hint: 'Add your Task',
                  onSaved: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 15),
                CustomTextFeild(
                  title: 'Note',
                  hint: 'Add your Note',
                  onSaved: (p0) {
                    note = p0;
                  },
                ),
                SizedBox(height: 15),
                CustomTextFeild(
                  isRead: true,
                  title: 'Date',
                  hint: date ?? 'Add Date',
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
                        hint: startTime ?? 'Add Time',
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
                        hint: endTime ?? 'Add Time',
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
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
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
                    BlocBuilder<AddTaskCubit, AddTaskState>(
                      builder: (context, state) {
                        return CustomButtonWidget(
                          name: 'Create Task',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<AddTaskCubit>(context).addTask(
                                TaskModel(
                                  title: title!,
                                  note: note!,
                                  date: date!,
                                  satrtTime: startTime!,
                                  endTime: endTime!,
                                  color: Color.fromARGB(
                                    255,
                                    33,
                                    243,
                                    226,
                                  ).toARGB32(),
                                ),
                              );
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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