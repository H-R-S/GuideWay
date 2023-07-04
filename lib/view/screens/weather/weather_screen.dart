import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../data/responses/status.dart';
import '../../../view_models/weather/weather_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/hourly_weather_container/hourly_weather_container.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../widgets/weather_header/weather_header.dart';
import '../../widgets/weekly_weather_container/weekly_weather_container.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  WeatherViewModel weatherViewModel = WeatherViewModel();

  @override
  void initState() {
    weatherViewModel.getWeather(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Weather"),
        body: ChangeNotifierProvider<WeatherViewModel>(
            create: (context) => weatherViewModel,
            child: Consumer<WeatherViewModel>(builder: (context, value, child) {
              switch (value.getWeatherDetails.status) {
                case Status.ERROR:
                  debugPrint(value.getWeatherDetails.message);
                  return Container();

                case Status.COMPLETED:
                  final weather = value.getWeatherDetails.data!;

                  return SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                              child: Column(children: [
                            WeatherHeader(
                                city: weather.location!.name ?? "",
                                temperature: weather.current!.tempC.toString(),
                                currentWeather:
                                    weather.current!.condition!.text ?? ""),
                            const SizedBox(height: 20),
                            Container(
                                height: 160,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal:
                                            BorderSide(color: Colors.grey))),
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: weather.forecast!
                                            .forecastday![0].hour!.length,
                                        itemBuilder: (context, index) {
                                          final hourlyWeather = weather
                                              .forecast!
                                              .forecastday![0]
                                              .hour![index];

                                          final dateTime = DateTime.parse(
                                              hourlyWeather.time!);
                                          final timeFormat = DateFormat('h a');

                                          final icon = extractPath(
                                              hourlyWeather.condition!.icon!);

                                          return HourlyWeatherContainer(
                                              time: timeFormat.format(dateTime),
                                              icon:
                                                  "assets/weather_icons/$icon",
                                              temperature: hourlyWeather.tempC
                                                  .toString());
                                        }))),
                            const SizedBox(height: 20),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    weather.forecast!.forecastday!.length,
                                itemBuilder: (context, index) {
                                  final weeklyWeather =
                                      weather.forecast!.forecastday![index];

                                  final date = DateFormat('yyyy-MM-dd')
                                      .parse(weeklyWeather.date!);
                                  final dateFormat = DateFormat('EEEE');

                                  final icon = extractPath(
                                      weeklyWeather.day!.condition!.icon!);

                                  return WeeklyWeatherContainer(
                                      day: dateFormat.format(date),
                                      icon: "assets/weather_icons/$icon",
                                      dayTemperature: weeklyWeather
                                          .day!.maxtempC
                                          .toString(),
                                      nightTemperature: weeklyWeather
                                          .day!.mintempC
                                          .toString());
                                })
                          ]))));
                default:
                  return const MyLoadingIndicator();
              }
            })));
  }

  String extractPath(String url) {
    final uri = Uri.parse(url);
    return uri.pathSegments.skip(2).join('/');
  }
}
