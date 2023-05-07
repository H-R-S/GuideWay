import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/icons.dart';
import 'package:guide_way/resources/constants/style.dart';
import 'package:guide_way/view/widgets/app_bar/my_app_bar.dart';

import '../../widgets/profile_container/profile_container.dart';
import '../../widgets/settings_container/settings_container.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Settings"),
        body: Column(children: [
          ProfileContainer(
              name: "Anus Ali Siddiqui",
              userName: "Anus",
              email: "anusali@gmail.com",
              onTap: () {}),
          SettingsContainer(
              icon: logoutIcon,
              title: "Logout",
              subTitle: "Logout from the App",
              onTap: () {}),
          SettingsContainer(
              icon: notificationIcon,
              title: "Notification",
              subTitle: "Get the Latest Update Notification",
              onTap: () {}),
          SettingsContainer(
              icon: darkModeIcon,
              title: "Dark Mode",
              subTitle: "Switch to Dark Mode",
              onTap: () {}),
          SettingsContainer(
              icon: privacyPolicyIcon,
              title: "Privacy Policy",
              subTitle: "GuideWay Privacy Policy",
              onTap: () {}),
        ]));
  }
}
