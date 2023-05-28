import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

class CountryContainer extends StatelessWidget {
  final String flag;
  final String title;
  final bool isChecked;
  final Function() onTap;

  const CountryContainer(
      {super.key,
      required this.onTap,
      required this.flag,
      required this.title,
      required this.isChecked});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return InkWell(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: isChecked ? primary : null,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: isChecked ? primary : light.withOpacity(.5))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(radius: 15, backgroundImage: AssetImage(flag)),
                    const SizedBox(width: 20),
                    Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(title,
                            style: TextStyle(
                                color:
                                    isDark || isChecked ? Colors.white : null,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)))
                  ]),
                  if (isChecked)
                    const Icon(Icons.check_circle,
                        size: 30, color: Colors.white)
                ])));
  }
}
