import 'package:flutter/material.dart';

class ForgotDialog extends StatelessWidget {
  const ForgotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
                width: double.infinity,
                child: Column(mainAxisSize: MainAxisSize.min, children: const [
                  CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.mark_email_read_outlined,
                          size: 50, color: Colors.white)),
                  SizedBox(height: 20),
                  Text("Check your email",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 20),
                  Text(
                      "We have sent password recovery instruction to your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          fontSize: 18))
                ]))));
  }
}
