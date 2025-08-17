import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.title,
    required this.hint,
    this.icon,
    this.onTap,
    this.isRead = false,

    this.onSaved,
    this.controller,
  });
  final String title;
  final String hint;
  final Widget? icon;
  final Function()? onTap;
  final bool isRead;

  final Function(String?)? onSaved;
  final TextEditingController? controller;
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
          controller: controller,

          onSaved: onSaved,
          readOnly: isRead,
          onTap: onTap,
          decoration: InputDecoration(
            suffixIcon: icon,
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
