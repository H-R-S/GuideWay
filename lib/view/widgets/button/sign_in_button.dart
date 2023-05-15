import 'package:flutter/material.dart';
import 'package:guide_way/routes/routes_name.dart';
import '../../../resources/constants/style.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Already have an account? ", style: TextStyle(fontSize: 16)),
      TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, RoutesName.login);
          },
          child: const Text("Sign In",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: primary, fontSize: 16)))
    ]);
  }
}
