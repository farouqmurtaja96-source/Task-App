import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: Icon(icon),
        ),

        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/11.jpeg'),
        ),
      ],
    );
  }
}
