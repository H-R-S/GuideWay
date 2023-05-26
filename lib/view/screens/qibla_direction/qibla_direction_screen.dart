import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/icons.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class QiblaDirectionScreen extends StatelessWidget {
  QiblaDirectionScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Qibla Direction"),
        body: Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 40),
            child: Column(children: [
              const Text("0°",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400, shape: BoxShape.circle),
                  child: Padding(
                      padding: const EdgeInsets.all(10).copyWith(bottom: 3),
                      child: Image.asset(qiblaCompasIcon)))
            ])));
  }
}
