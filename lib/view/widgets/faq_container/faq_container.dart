import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/style.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

class FAQContainer extends StatelessWidget {
  final String question;
  final String answer;

  const FAQContainer({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    bool isDark = theme.currentTheme == ThemeData.dark();

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: isDark ? dark : Colors.grey.shade200,
            border: Border.all(
                color: isDark ? dark : Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10)),
        child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
                backgroundColor: isDark ? dark : Colors.grey.shade200,
                tilePadding: const EdgeInsets.all(10),
                textColor: isDark ? Colors.white : Colors.black,
                iconColor: Colors.grey,
                title: Text(question,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                childrenPadding: const EdgeInsets.all(10),
                children: [
                  Text(answer,
                      style: TextStyle(
                          color: isDark ? Colors.grey.shade200 : null,
                          fontSize: 16))
                ])));
  }
}
