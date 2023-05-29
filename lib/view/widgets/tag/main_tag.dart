import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

class MainTag extends StatelessWidget {
  final String title, subTitle;

  const MainTag({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Column(children: [
      FittedBox(
          child: Text(title,
              style: TextStyle(
                  color: isDark ? Colors.white : null,
                  fontSize: 25,
                  fontWeight: FontWeight.bold))),
      Text(subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey)),
    ]);
  }
}
