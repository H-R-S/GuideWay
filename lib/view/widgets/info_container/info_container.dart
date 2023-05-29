import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/style.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_provider.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String icon;
  final Function() onTap;
  final bool isDisable;

  const InfoContainer(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.isDisable = false});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return InkWell(
        onTap: isDisable ? null : onTap,
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: isDark ? dark : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: isDark ? Colors.black12 : Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 4))
                ],
                borderRadius: BorderRadius.circular(20)),
            child: FittedBox(
                child: Column(children: [
              Image.asset(icon, height: 100, width: 100),
              const SizedBox(height: 10),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: isDark ? Colors.white : null,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))
            ]))));
  }
}
