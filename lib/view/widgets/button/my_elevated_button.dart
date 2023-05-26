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
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: primary),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ))));
  }
}
