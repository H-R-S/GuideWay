import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../routes/routes_name.dart';
import '../../../theme/theme_provider.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Don't have an account? ",
          style: TextStyle(color: isDark ? Colors.white : null, fontSize: 16)),
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
