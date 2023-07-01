import 'package:flutter/material.dart';
import 'package:guide_way/services/formatter/formatter_service.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

class FeedBackContainer extends StatelessWidget {
  final String name, dateTime, reason, feedback;

  const FeedBackContainer(
      {super.key,
      required this.name,
      required this.dateTime,
      required this.reason,
      required this.feedback});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    bool isDark = theme.currentTheme == ThemeData.dark();

    final style = TextStyle(color: isDark ? Colors.white : null, fontSize: 20);

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: light),
            borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const CircleAvatar(
                backgroundColor: Colors.grey, child: Icon(Icons.person)),
            const SizedBox(width: 10),
            Text(name, style: style)
          ]),
          const SizedBox(height: 10),
          Text(Formatter.dateTimeformatter(dateTime),
              style: style.copyWith(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 10),
          Text("Reason: $reason", style: style),
          const SizedBox(height: 10),
          Text("FeedBack: $feedback", style: style)
        ]));
  }
}
