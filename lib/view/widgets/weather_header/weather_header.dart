import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_provider.dart';

class WeatherHeader extends StatelessWidget {
  final String city, temperature, currentWeather;

  const WeatherHeader(
      {super.key,
      required this.city,
      required this.temperature,
      required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
      color: isDark ? Colors.white : null,
      fontSize: 25, fontWeight: FontWeight.bold);

    return Column(children: [
      Text(city, style: style),
      Text("$temperature°",
          style: style.copyWith(fontWeight: FontWeight.normal)),
      Text(currentWeather,
          style: style.copyWith(
              fontWeight: FontWeight.normal, color: Colors.grey.shade700)),
    ]);
  }
}
