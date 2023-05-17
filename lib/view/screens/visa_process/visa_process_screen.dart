import 'package:flutter/material.dart';
import '../../../resources/data/visa_process.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/visa_process/visa_process_container.dart';

class VisaProcessScreen extends StatelessWidget {
  VisaProcessScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Visa Process FAQ"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: visaProcess.length,
                itemBuilder: (context, index) {
                  return VisaProcessContainer(
                      title: visaProcess[index]["title"],
                      subTitle: visaProcess[index]["subTitle"],
                      icon: visaProcess[index]["icon"]);
                })));
  }
}
