import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/responses/status.dart';
import '../../../view_models/prayer/prayer_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/prayer_time_container/prayer_time_container.dart';

class PrayerTimingsScreen extends StatefulWidget {
  const PrayerTimingsScreen({super.key});

  @override
  State<PrayerTimingsScreen> createState() => _PrayerTimingsScreenState();
}

class _PrayerTimingsScreenState extends State<PrayerTimingsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  PrayerViewModel prayerViewModel = PrayerViewModel();

  @override
  void initState() {
    prayerViewModel.getPrayerDetails(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Prayer Timings"),
        body: ChangeNotifierProvider<PrayerViewModel>(
            create: (context) => prayerViewModel,
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Consumer<PrayerViewModel>(
                        builder: (context, value, child) {
                      switch (value.prayerDetails.status) {
                        case Status.ERROR:
                          debugPrint(value.prayerDetails.message);
                          return Container();
              
                        case Status.COMPLETED:
                          final prayerTimings =
                              value.prayerDetails.data!.data!.timings!;
              
                          final prayerDate =
                              value.prayerDetails.data!.data!.date!;

                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PrayerTimeContainer(isInfoHeader: true),
                                PrayerTimeContainer(
                                    title: "Date :", value: prayerDate.readable),
                                PrayerTimeContainer(
                                    title: "Date Hijri :",
                                    value: prayerDate.hijri!.date),
                                PrayerTimeContainer(
                                    title: "Month Hijri :",
                                    value:
                                        "${prayerDate.hijri!.month!.en} ( ${prayerDate.hijri!.month!.ar} )"),
                                const PrayerTimeContainer(isHeader: true),
                                PrayerTimeContainer(
                                    title: "Fajr", value: prayerTimings.fajr),
                                PrayerTimeContainer(
                                    title: "Sunrise",
                                    value: prayerTimings.sunrise),
                                PrayerTimeContainer(
                                    title: "Dhuhr", value: prayerTimings.dhuhr),
                                PrayerTimeContainer(
                                    title: "Asr", value: prayerTimings.asr),
                                PrayerTimeContainer(
                                    title: "Sunset", value: prayerTimings.sunset),
                                PrayerTimeContainer(
                                    title: "Maghrib",
                                    value: prayerTimings.maghrib),
                                PrayerTimeContainer(
                                    title: "Isha", value: prayerTimings.isha)
                              ]);
              
                        default:
                          return const Center(child: CircularProgressIndicator());
                      }
                    })),
              );
            }));
  }
}
