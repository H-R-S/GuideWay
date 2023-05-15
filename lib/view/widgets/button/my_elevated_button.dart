import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const MyElevatedButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15).copyWith(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: primary),
          child: Center(
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
        ));
  }
}
