import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  final bool isHeader;
  final String? title;
  final String? subTitle;
  final String icon;
  final Function()? onTap;
  final bool isDrawer;
  final bool isSwitch;
  final Color? iconColor;
  bool isDark;

  SettingsContainer(
      {super.key,
      this.isHeader = false,
      this.title,
      this.subTitle,
      required this.icon,
      this.iconColor,
      this.isDrawer = false,
      this.isSwitch = false,
      this.isDark = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
            onTap: onTap,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SizedBox(height: 40, child: Image.asset(icon)),
                        Padding(
                            padding: const EdgeInsets.all(10)
                                .copyWith(left: 30, top: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title ?? "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text(subTitle ?? "",
                                      style: const TextStyle(fontSize: 16))
                                ]))
                      ]),
                      if (onTap != null)
                        isSwitch
                            ? Switch(value: false, onChanged: (value) {})
                            : const Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.grey)
                    ]))));
  }
}
