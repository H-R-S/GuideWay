import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../../../routes/routes_name.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.forgotPassword);
          },
          child: const Text("Forgot Password?",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: primary)))
    ]);
  }
}
