import 'package:flutter/material.dart';

class MyCircleButton extends StatelessWidget {
  final String icon;
  final Function() onTap;

  const MyCircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 25, 
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(icon)));
  }
}
