import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/icons.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

AppBar MyAppBar(GlobalKey<ScaffoldState> key, BuildContext context,
    {bool isHome = false,
    bool isDrawer = false,
    bool isProfile = false,
    bool isBack = false,
    int? index,
    Function()? onTapProfile,
    Function()? onTapBackButton,
    Widget? bottom,
    String? title,
    bool centerTitle = true}) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  bool isDark = themeProvider.currentTheme == ThemeData.dark();

  return AppBar(
      elevation: 0,
      backgroundColor: isDark ? dark : primaryLight,
      centerTitle: isHome ? false : centerTitle,
      leading: isBack
          ? BackButton(
              color: isDark ? Colors.white : Colors.grey,
              onPressed: onTapBackButton ??
                  () {
                    Navigator.pop(context);
                  })
          : null,
      // bottom: bottom != null
      //     ? PreferredSize(
      //         preferredSize: const Size.fromHeight(75), child: bottom)
      //     : null,
      title: isHome
          ? Row(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(guideWayIcon, height: 35),
              const SizedBox(width: 5),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("GuideWay",
                      style: TextStyle(
                          color: isDark ? Colors.white : null,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)))
            ])
          : Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(title ?? "",
                  style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold)),
            ));
}
