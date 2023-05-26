import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/icons.dart';
import '../../../resources/constants/style.dart';

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
  return AppBar(
      elevation: 0,
      backgroundColor: primaryLight,
      centerTitle: isHome ? false : centerTitle,
      leading: isBack
          ? BackButton(
              color: Colors.grey,
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
              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text("GuideWay",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
            ])
          : Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(title ?? "",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ));
}
