import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/icons.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class QiblaDirectionScreen extends StatelessWidget {
  QiblaDirectionScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Qibla Direction"),
        body: Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 40),
            child: Column(children: [
              Text("0°",
                  style: TextStyle(
                      color: isDark ? Colors.white : null,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      color: isDark ? null : Colors.grey.shade400,
                      shape: BoxShape.circle),
                  child: Padding(
                      padding: const EdgeInsets.all(10).copyWith(bottom: 3),
                      child: Image.asset(qiblaCompasIcon)))
            ])));
  }
}
