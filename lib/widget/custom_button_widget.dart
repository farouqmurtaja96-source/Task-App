import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.onTap,
    required this.name,
    this.width = 110,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
  });
  final Function()? onTap;
  final String name;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: borderColor!),
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: width,
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
