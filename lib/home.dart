import 'package:flutter/material.dart';
import 'package:guide_way/view/screens/chat/chat_screen.dart';
import 'package:guide_way/view/screens/scanner/scanner_screen.dart';
import 'package:guide_way/view/screens/visa_process/visa_process_screen.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            backgroundColor: primary.withOpacity(0.1),
            currentIndex: currentIndex,
            selectedItemColor: primary,
            unselectedItemColor: primary.withOpacity(.4),
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
               BottomNavigationBarItem(icon: Container(
                   padding: const EdgeInsets.all(10),
                   decoration: BoxDecoration(
                       boxShadow: const [
                         BoxShadow(
                             color: Colors.grey,
                             spreadRadius: 1,
                             blurRadius: 5,
                             offset: Offset(0, 4))
                       ],
                       color: primaryLight,
                       borderRadius: BorderRadius.circular(20)),
                   child: Image.asset(scanIcon, height: 40)), label: "Scan"),
              BottomNavigationBarItem(
                  icon: Image.asset(chatIcon, height: 40), label: ""),
              BottomNavigationBarItem(
                  icon: Image.asset(settingsIcon, height: 40), label: "")
            ]));
  }
}
