import 'package:flutter/material.dart';
import 'package:guide_way/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();
    
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
     Text("Already have an account? ", style: TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 16)),
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
