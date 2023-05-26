import 'package:flutter/material.dart';
import '../../../resources/constants/flags.dart';
import '../../../resources/constants/icons.dart';
import '../../../routes/routes_name.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/profile_container/profile_container.dart';
import '../../widgets/settings_container/settings_container.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Settings"),
        body: SingleChildScrollView(
            child: Column(children: [
          ProfileContainer(
              name: "Anus Ali Siddiqui",
              userName: "Anus",
              email: "anusali@gmail.com",
              onTap: () {}),
          SettingsContainer(
              icon: logoutIcon,
              title: "Logout",
              subTitle: "Logout from the App",
              onTap: () {
                Navigator.pushReplacementNamed(context, RoutesName.login);
              }),
          SettingsContainer(
              icon: germanyFlag,
              title: "Country",
              subTitle: "Change your desire country",
              onTap: () {
                Navigator.pushReplacementNamed(context, RoutesName.country);
              }),
          SettingsContainer(
              icon: notificationIcon,
              title: "Notification",
              subTitle: "Get the Latest Update Notification",
              onTap: () {}),
          SettingsContainer(
              isSwitch: true,
              icon: darkModeIcon,
              title: "Dark Mode",
              subTitle: "Switch to Dark Mode",
              onTap: () {}),
          SettingsContainer(
              icon: privacyPolicyIcon,
              title: "Privacy Policy",
              subTitle: "GuideWay Privacy Policy",
              onTap: () {}),
          SettingsContainer(
              icon: termsAndConditionIcon,
              title: "Terms & Conditions",
              subTitle: "GuideWay Terms & Conditions",
              onTap: () {}),
          const SizedBox(height: 50)
        ])));
  }
}
