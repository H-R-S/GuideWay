import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Notifications"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Text("No notification at the moment",
                style: TextStyle(
                    color: isDark ? Colors.white : null, fontSize: 18))));
  }
}
