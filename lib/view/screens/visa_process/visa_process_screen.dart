import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/style.dart';
import 'package:guide_way/view/widgets/app_bar/my_app_bar.dart';

class VisaProcessScreen extends StatelessWidget {
  VisaProcessScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Visa Process"),
        body: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Row(children: [
                CircleAvatar(
                    backgroundColor: primaryLight,
                    radius: 30,
                    child: Icon(Icons.circle_outlined)),
                SizedBox(width: 10),
                Text("Step 01")
              ]),
              SizedBox(height: 20),
              Row(children: [
                CircleAvatar(
                    backgroundColor: primaryLight,
                    radius: 30,
                    child: Icon(Icons.circle_outlined)),
                SizedBox(width: 10),
                Text("Step 02"),
              ]),
              SizedBox(height: 20),
              Row(children: [
                CircleAvatar(
                    backgroundColor: primaryLight,
                    radius: 30,
                    child: Icon(Icons.circle_outlined)),
                SizedBox(width: 10),
                Text("Step 03"),
              ]),
              SizedBox(height: 20),
              Row(children: [
                CircleAvatar(
                    backgroundColor: primaryLight,
                    radius: 30,
                    child: Icon(Icons.circle_outlined)),
                SizedBox(width: 10),
                Text("Step 04"),
              ]),
              SizedBox(height: 20),
              Row(children: [
                CircleAvatar(
                    backgroundColor: primaryLight,
                    radius: 30,
                    child: Icon(Icons.circle_outlined)),
                SizedBox(width: 10),
                Text("Step 05"),
              ])
            ])));
  }
}
