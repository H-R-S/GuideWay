import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

class ForgotDialog extends StatelessWidget {
  const ForgotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            width: double.infinity,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.mark_email_read_outlined,
                      size: 50, color: Colors.white)),
              const SizedBox(height: 20),
              Text("Check your email",
                  style: TextStyle(
                      color: isDark ? Colors.white : null,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(height: 20),
              Text("We have sent password recovery instruction to your email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: isDark ? Colors.white70 : Colors.black54,
                      fontSize: 18))
            ])));
  }
}
