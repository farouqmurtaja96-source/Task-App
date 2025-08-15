import 'package:flutter/material.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _LastSeactionState();
}

class _LastSeactionState extends State<ColorList> {
  List color = [
    const Color.fromARGB(255, 33, 159, 243),
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
