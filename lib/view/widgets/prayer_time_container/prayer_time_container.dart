import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

class PrayerTimeContainer extends StatelessWidget {
  final String? title, value;
  final bool isHeader, isInfoHeader;

  const PrayerTimeContainer(
      {super.key,
      this.isInfoHeader = false,
      this.isHeader = false,
      this.title,
      this.value});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark && isHeader || isInfoHeader
            ? Colors.white
            : isHeader
                ? Colors.grey
                : null,
        fontSize: 18,
        fontWeight: FontWeight.bold);

    return Padding(
        padding: EdgeInsets.symmetric(vertical: isHeader ? 20 : 10),
        child: 
        isInfoHeader ? Text("Islamic Calender", style: style) :
        isHeader
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Prayer", style: style),
                Text("Adhan", style: style)
              ])
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(title ?? "",
                    style: style.copyWith(color: isDark ? Colors.grey : null)),
                Text(value ?? "",
                    style: style.copyWith(
                        color: isDark ? Colors.grey : null,
                        fontWeight: FontWeight.normal))
              ]));
  }
}
