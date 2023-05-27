import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/app_bar/my_app_bar.dart';
import 'package:guide_way/view/widgets/button/my_elevated_button.dart';
import 'package:guide_way/view/widgets/text_field/my_text_field.dart';

class FeedBackScreen extends StatelessWidget {
  FeedBackScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController feedbackReasonController =
      TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "FeedBack"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              MyTextField(
                  header: "FeedBack Reason",
                  isRequired: true,
                  isReadable: true,
                  controller: feedbackReasonController,
                  dropDownList: const [
                    "I have a question",
                    "I want to report a problem",
                    "I want to request a feature",
                    "I like the app because",
                    "Other"
                  ],
                  hint: "Reason for FeedBack"),
              MyTextField(
                  header: "FeedBack",
                  isRequired: true,
                  controller: feedbackController,
                  minLine: 3,
                  hint: "Type your feedback here"),
              const SizedBox(height: 40),
              MyElevatedButton(title: "Submit", onTap: () {})
            ])));
  }
}
