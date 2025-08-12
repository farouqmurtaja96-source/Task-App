import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.title,
    required this.hint,
    this.iconButton,
  });
  final String title;
  final String hint;
  final IconButton? iconButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: iconButton,
            hintText: hint,
            border: OutlineWidget(Colors.grey),
            enabledBorder: OutlineWidget(Colors.grey),
            focusedBorder: OutlineWidget(Colors.lightBlueAccent),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder OutlineWidget(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }
}
