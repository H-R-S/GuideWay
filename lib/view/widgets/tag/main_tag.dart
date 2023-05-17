import 'package:flutter/material.dart';

class MainTag extends StatelessWidget {
  final String title, subTitle;

  const MainTag({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(
          child: Text(title,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
      Text(subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey)),
    ]);
  }
}
