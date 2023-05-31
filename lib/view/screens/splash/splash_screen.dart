import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/style.dart';
import '../../../services/splash/splash_service.dart';
import '../../../theme/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.checkCountryId(context);
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        backgroundColor: isDark ? dark : primaryLight,
        body:
            Center(child: Image.asset(guideWayIcon, height: 250, width: 250)));
  }
}
