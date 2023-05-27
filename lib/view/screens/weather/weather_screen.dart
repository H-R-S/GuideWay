import 'package:flutter/material.dart';
import '../../../resources/data/weather.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/hourly_weather_container/hourly_weather_container.dart';
import '../../widgets/weather_header/weather_header.dart';
import '../../widgets/weekly_weather_container/weekly_weather_container.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Weather"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Column(children: [
                  const WeatherHeader(
                      city: "London",
                      temperature: "24",
                      currentWeather: "Cloudy"),
                  const SizedBox(height: 20),
                  Container(
                      height: 160,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(color: Colors.grey))),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: hourlyWeather.length,
                              itemBuilder: (context, index) {
                                return HourlyWeatherContainer(
                                    time: hourlyWeather[index]["time"],
                                    icon: hourlyWeather[index]["icon"],
                                    temperature: hourlyWeather[index]
                                        ["temperature"]);
                              }))),
                  const SizedBox(height: 20),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: weeklyWeather.length,
                      itemBuilder: (context, index) {
                        return WeeklyWeatherContainer(
                            day: weeklyWeather[index]["day"],
                            icon: weeklyWeather[index]["icon"],
                            dayTemperature: weeklyWeather[index]
                                ["dayTemperature"],
                            nightTemperature: weeklyWeather[index]
                                ["nightTemperature"]);
                      })
                ])))));
  }
}
