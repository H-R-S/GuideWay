import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';
import '../button/my_elevated_button.dart';
import '../text_field/my_text_field.dart';

class AddFeedBackContainer extends StatelessWidget {
  final TextEditingController reasonController, feedbackController;
  final Function() onTap;
  final bool isLoading;

  const AddFeedBackContainer(
      {super.key,
      required this.reasonController,
      required this.feedbackController,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    bool isDark = theme.currentTheme == ThemeData.dark();

    // final style = TextStyle(
    //     color: isDark ? Colors.white : null,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 20);

    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: isDark ? dark : null,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          MyTextField(
              header: "FeedBack Reason",
              isRequired: true,
              isReadable: true,
              controller: reasonController,
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
          MyElevatedButton(isLoading: isLoading, title: "Submit", onTap: onTap)
        ]));
  }
}
