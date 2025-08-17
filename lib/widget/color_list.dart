import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_v1/cubit/add_task_cubit/add_task_cubit.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key, this.initialColor});
  final int? initialColor;
  @override
  State<ColorList> createState() => _LastSeactionState();
}

class _LastSeactionState extends State<ColorList> {
  List<Color> colors = [
    const Color.fromARGB(255, 33, 159, 243),
    Color.fromARGB(255, 33, 243, 226),
    Color.fromARGB(255, 243, 33, 243),
  ];
  int isActive = 0;
  void initState() {
    super.initState();
    // لو في لون قديم، نجيبه ونعرف index تبعه
    if (widget.initialColor != null) {
      isActive = colors.indexWhere((c) => c.toARGB32() == widget.initialColor);
      if (isActive == -1) isActive = 0; // لو اللون مش موجود بالقائمة
      BlocProvider.of<AddTaskCubit>(context).color = colors[isActive];
    } else {
      isActive = 0;
      BlocProvider.of<AddTaskCubit>(context).color = colors[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<AddTaskCubit>(context).color = colors[index];
              setState(() {
                isActive = index; // تحديث اللون النشط
              });
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colors[index],
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
