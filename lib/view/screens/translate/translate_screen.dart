import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/button/my_elevated_button.dart';
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
              const SizedBox(height: 20),
              MyTextField(
                  header: "Translation",
                  minLine: 5,
                  controller: translateController,
                  hint: "Translation"),
              const SizedBox(height: 40),
              MyElevatedButton(title: "Translate", onTap: () {})
            ])));
  }
}
