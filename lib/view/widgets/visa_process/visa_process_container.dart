import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class VisaProcessContainer extends StatelessWidget {
  final String title, subTitle, icon;

  const VisaProcessContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [
          CircleAvatar(
              backgroundColor: primaryLight,
              radius: 40,
              child: Image.asset(icon)),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: style),
            Text(subTitle, style: style.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal))
          ])
        ]));
  }
}