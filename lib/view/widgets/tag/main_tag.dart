import 'package:flutter/material.dart';

class MainTag extends StatelessWidget {
  final String title, subTitle;

  const MainTag({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(
        child: Text(title,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w900)),
      ),
      Text(subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey)),
    ]);
  }
}
