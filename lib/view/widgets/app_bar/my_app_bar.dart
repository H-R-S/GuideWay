import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/style.dart';

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
      centerTitle: centerTitle,
      leading: isBack
          ? BackButton(
              color: Colors.grey,
              onPressed: onTapBackButton ??
                  () {
                    Navigator.pop(context);
                  })
          : null,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(75), child: bottom)
          : null,
      title: isHome
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("GUIDE",
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 30)),
                Text("WAY",
                    style: TextStyle(
                        color: light,
                        fontWeight: FontWeight.w900,
                        fontSize: 30))
              ],
            )
          : Text(title ?? "",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w900)));
}
