import 'package:flutter/material.dart';
import 'package:guide_way/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';

// ignore: must_be_immutable
class SettingsContainer extends StatefulWidget {
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
  State<SettingsContainer> createState() => _SettingsContainerState();
}

class _SettingsContainerState extends State<SettingsContainer> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
            onTap: widget.onTap,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(widget.icon)),
                        Padding(
                            padding: const EdgeInsets.all(10)
                                .copyWith(left: 30, top: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.title ?? "",
                                      style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : null,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: Text(widget.subTitle ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color:
                                                  isDark ? Colors.grey : null,
                                              fontSize: 16)))
                                ]))
                      ]),
                      widget.isSwitch
                          ? Container(
                              height: 20,
                              width: 20,
                              padding: const EdgeInsets.only(right: 20),
                              child: Switch(
                                  inactiveTrackColor: Colors.grey,
                                  activeTrackColor: primary,
                                  value: isDark,
                                  onChanged: (value) {
                                    setState(() {
                                      isDark = value;
                                    });
                                  }))
                          : widget.onTap != null
                              ? const Icon(Icons.arrow_forward_ios,
                                  size: 20, color: Colors.grey)
                              : const SizedBox()
                    ]))));
  }
}
