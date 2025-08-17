import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_v1/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:task_v1/cubit/get_task_cubit/get_task_cubit.dart';
import 'package:task_v1/model/task_model.dart';
import 'package:task_v1/widget/app_bar_widget.dart';
import 'package:task_v1/widget/color_list.dart';
import 'package:task_v1/widget/custom_button_widget.dart';
import 'package:task_v1/widget/custom_text_feild.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EidtTaskView extends StatefulWidget {
  const EidtTaskView({super.key, this.task});
  final TaskModel? task;
  @override
  State<EidtTaskView> createState() => _EidtTaskViewState();
}

class _EidtTaskViewState extends State<EidtTaskView> {
  TextEditingController? titleController;
  TextEditingController? noteController;
  TextEditingController? dateController;
  TextEditingController? startTimeController;
  TextEditingController? endTimeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.task?.title);
    noteController = TextEditingController(text: widget.task?.note);
    dateController = TextEditingController(text: widget.task?.date);
    startTimeController = TextEditingController(text: widget.task?.satrtTime);
    endTimeController = TextEditingController(text: widget.task?.endTime);
  }

  @override
  void dispose() {
    titleController?.dispose();
    noteController?.dispose();
    dateController?.dispose();
    startTimeController?.dispose();
    endTimeController?.dispose();
    super.dispose();
  }

  String? date, startTime, endTime, remidenValue, repat, title, note;
  final List<String> remindOptions = [
    "10 minutes ",
    "15 minutes",
    "20 minutes",
    "25 minutes",
  ];
  final List<String> repatOptions = ["1 ", "2", "3", "4"];
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: titleController,
                title: 'Title',
                hint: 'Add your Task',
                onSaved: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 15),
              CustomTextFeild(
                controller: noteController,
                title: 'Note',
                hint: 'Add your Note',
                onSaved: (value) {
                  note = value;
                },
              ),
              SizedBox(height: 15),
              CustomTextFeild(
                controller: dateController,
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
                      controller: startTimeController,
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
                      controller: endTimeController,
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
                        child: ColorList(initialColor: widget.task!.color),
                      ),
                    ],
                  ),
                  BlocBuilder<AddTaskCubit, AddTaskState>(
                    builder: (context, state) {
                      return CustomButtonWidget(
                        name: 'Create Task',
                        onTap: () {
                          widget.task!.title = titleController!.text;
                          widget.task!.note = noteController!.text;
                          widget.task!.date = dateController!.text;
                          widget.task!.satrtTime = startTimeController!.text;
                          widget.task!.endTime = endTimeController!.text;
                          widget.task!.color = BlocProvider.of<AddTaskCubit>(
                            context,
                          ).color.toARGB32();

                          widget.task!.save();
                          BlocProvider.of<GetTaskCubit>(context).getTask();
                          Navigator.pop(context);
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
    );
  }
}
