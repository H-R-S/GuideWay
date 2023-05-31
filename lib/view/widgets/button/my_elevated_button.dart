import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function() onTap;

  const MyElevatedButton(
      {super.key,
      this.isLoading = false,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: primary),
            child: Center(
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ))));
  }
}
