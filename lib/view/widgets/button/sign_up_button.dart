import 'package:flutter/material.dart';
import 'package:guide_way/routes/routes_name.dart';
import '../../../resources/constants/style.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't have an account? ", style: TextStyle(fontSize: 16)),
      TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.signup);
          },
          child: const Text("Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: primary, fontSize: 16)))
    ]);
  }
}
