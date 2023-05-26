import 'package:flutter/material.dart';
import '../../../resources/data/job_timings.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class JobTimingsScreen extends StatelessWidget {
  JobTimingsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 18, fontWeight: FontWeight.normal);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Job Timings"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Text(jobTimings[0]["description"], style: style),
                  const SizedBox(height: 20),
                  Text(jobTimings[0]["rules"], style: style)
                ]))));
  }
}