import 'package:flutter/material.dart';

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
    double width = MediaQuery.of(context).size.width;
    const style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(width: width * 0.35, child: Text(day, style: style)),
          SizedBox(width: width * 0.25, child: Image.asset(icon, height: 40)),
          SizedBox(
              width: width * 0.2,
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
