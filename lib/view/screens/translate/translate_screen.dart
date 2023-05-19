import 'package:flutter/material.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/text_field/my_text_field.dart';

class TranslateScreen extends StatelessWidget {
  TranslateScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController translateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Translate"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              MyTextField(
                  header: "English (US)",
                  controller: translateController,
                  hint: "Enter Text"),
              Icon(Icons.keyboard_double_arrow_down_sharp),
              MyTextField(
                  minLine: 5,
                  controller: translateController,
                  hint: "Translation")
            ])));
  }
}
