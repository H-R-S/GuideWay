import 'package:flutter/material.dart';
import 'package:guide_way/resources/data/prayer_time.dart';
import 'package:guide_way/view/widgets/prayer_time_container/prayer_time_container.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class PrayerTimingsScreen extends StatelessWidget {
  PrayerTimingsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Prayer Timings"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const PrayerTimeContainer(isHeader: true),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: prayerTime.length,
                  itemBuilder: (context, index) {
                    return PrayerTimeContainer(
                        name: prayerTime[index]["name"],
                        azanTime: prayerTime[index]["azanTime"],
                        iqamaTime: prayerTime[index]["iqamaTime"]);
                  })
            ])));
  }
}
