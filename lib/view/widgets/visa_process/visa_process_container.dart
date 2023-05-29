import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

class VisaProcessContainer extends StatelessWidget {
  final String title, subTitle, icon;

  const VisaProcessContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 20,
        fontWeight: FontWeight.bold);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [
          CircleAvatar(
              backgroundColor: isDark ? Colors.black12 : primaryLight,
              radius: 40,
              child: Image.asset(icon)),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(title,
                    maxLines: 2, overflow: TextOverflow.ellipsis, style: style),
                Text(subTitle,
                    style: style.copyWith(
                        color: isDark ? Colors.grey : null,
                        fontSize: 16,
                        fontWeight: FontWeight.normal))
              ]))
        ]));
  }
}
