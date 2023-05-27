import 'package:flutter/material.dart';
import 'package:guide_way/resources/data/rules.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class TransportRulesScreen extends StatelessWidget {
  TransportRulesScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();
    
    final style = TextStyle(
      color: isDark ? Colors.white : null,
      fontSize: 18, fontWeight: FontWeight.normal);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Transport Rules"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Text(transportRules[0]["description"], style: style),
                  const SizedBox(height: 20),
                  Text(transportRules[0]["rules"], style: style)
                ]))));
  }
}
