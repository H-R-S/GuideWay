import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/country/country_model.dart';
import '../../../models/user/user_model.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/images.dart';
import '../../../resources/data/countries.dart';
import '../../../routes/routes_name.dart';
import '../../../theme/theme_provider.dart';
import '../../../view_models/auth/auth_view_model.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../widgets/profile_container/profile_container.dart';
import '../../widgets/settings_container/settings_container.dart';
import '../country/country_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Settings"),
        body: SingleChildScrollView(
            child: Column(children: [
          Consumer<UserViewModel>(builder: (context, value, child) {
            return FutureBuilder<UserModel?>(
                future: value.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    debugPrint(snapshot.error.toString());
                    return Container();
                  }
                  if (snapshot.hasData) {
                    final user = snapshot.data!;

                    CountryModel? userCountry = countries
                        .firstWhere((country) => country.id == user.countryId);

                    return Column(children: [
                      ProfileContainer(
                          name: user.fullName ?? "",
                          userName: user.username ?? "",
                          email: user.email ?? "",
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.profile);
                          }),
                      SettingsContainer(
                          icon: passwordIcon,
                          title: "Change Password",
                          subTitle: "Update your password",
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.changePassword);
                          }),
                      SettingsContainer(
                          icon: logoutIcon,
                          title: "Logout",
                          subTitle: "Logout from the App",
                          onTap: () {
                            authViewModel.signOut(context);
                          }),
                      SettingsContainer(
                          icon: userCountry.flag ?? emptyImage,
                          title: "Country",
                          subTitle: "Change your desire country",
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryScreen(
                                        countryId: int.parse(
                                            user.countryId.toString()))));
                          })
                    ]);
                  }
                  return const MyLoadingIndicator();
                });
          }),
          Consumer<ThemeProvider>(builder: (context, value, child) {
            final isDark = value.currentTheme == ThemeData.dark();

            return SettingsContainer(
                isDark: isDark,
                isSwitch: true,
                icon: isDark ? sunIcon : darkModeIcon,
                title: "${isDark ? "Light" : "Dark"} Mode",
                subTitle: "Switch to ${isDark ? "Light" : "Dark"} Mode",
                onTap: value.toggleTheme);
          }),
          SettingsContainer(
              icon: notificationIcon,
              title: "Notification",
              subTitle: "Get the Latest Update Notification",
              onTap: () {
                Navigator.pushNamed(context, RoutesName.notifications);
              }),
          SettingsContainer(
              icon: chatIcon,
              title: "FeedBack",
              subTitle: "Help us to improve your experience",
              onTap: () {
                Navigator.pushNamed(context, RoutesName.feedback);
              }),
          SettingsContainer(
              icon: privacyPolicyIcon,
              title: "Privacy Policy",
              subTitle: "GuideWay Privacy Policy",
              onTap: () {
                Navigator.pushNamed(context, RoutesName.privacyPolicy);
              }),
          SettingsContainer(
              icon: termsAndConditionIcon,
              title: "Terms & Conditions",
              subTitle: "GuideWay Terms & Conditions",
              onTap: () {
                Navigator.pushNamed(context, RoutesName.termsAndCondition);
              }),
          const SizedBox(height: 50)
        ])));
  }
}
