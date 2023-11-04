import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

class WeeklyWeatherContainer extends StatelessWidget {
  final String day, icon, dayTemperature, nightTemperature;

  const WeeklyWeatherContainer(
      {super.key,
      required this.day,
      required this.icon,
      required this.dayTemperature,
      required this.nightTemperature});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    double width = MediaQuery.of(context).size.width;

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 16,
        fontWeight: FontWeight.bold);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(width: width * 0.3, child: Text(day, style: style)),
          SizedBox(width: width * 0.2, child: Image.asset(icon, height: 40)),
          SizedBox(
              width: width * 0.3,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text("$dayTemperature° ",
                    style: style.copyWith(fontWeight: FontWeight.normal)),
                Text("/ $nightTemperature°",
                    style: style.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.grey))
              ]))
        ]));
  }
}
