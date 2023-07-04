import 'package:flutter/material.dart';
import 'package:guide_way/services/notification/notification_service.dart';
import 'package:guide_way/theme/theme_provider.dart';
import 'package:guide_way/view/screens/faq/faq_screen.dart';
import 'package:guide_way/view/screens/scanner/scanner_screen.dart';
import 'package:guide_way/view/screens/visa_process/visa_process_screen.dart';
import 'package:provider/provider.dart';
import 'resources/constants/icons.dart';
import 'resources/constants/style.dart';
import 'view/screens/home/home_screen.dart';
import 'view/screens/settings/settings_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    notificationService.requestNotificationPermission();
    notificationService.firebaseInit(context);
    notificationService.setupInterectMessage(context);
    notificationService.getDeviceToken().then((value) {
      debugPrint("Device Token: $value");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    List<Widget> screens = [
      HomeScreen(),
      VisaProcessScreen(),
      ScannerScreen(),
      ChatScreen(),
      SettingsScreen()
    ];

    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: isDark ? dark : primaryLight,
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(homeIcon, height: 40), label: ""),
              BottomNavigationBarItem(
                  icon: Image.asset(taskIcon, height: 40), label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: isDark ? dark : Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 4))
                          ],
                          color: isDark ? Colors.black12 : primaryLight,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(scanIcon, height: 30)),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Image.asset(chatIcon, height: 40), label: ""),
              BottomNavigationBarItem(
                  icon: Image.asset(settingsIcon, height: 40), label: "")
            ]));
  }
}
