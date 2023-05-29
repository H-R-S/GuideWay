import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

class HourlyWeatherContainer extends StatelessWidget {
  final String time, icon, temperature;

  const HourlyWeatherContainer(
      {super.key,
      required this.time,
      required this.icon,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 16,
        fontWeight: FontWeight.normal);

    return SizedBox(
        width: 100,
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(time, style: style),
          const SizedBox(height: 10),
          Image.asset(icon, height: 40),
          const SizedBox(height: 20),
          Text("$temperature°", style: style)
        ])));
  }
}
