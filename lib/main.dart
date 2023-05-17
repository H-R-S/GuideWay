import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/routes.dart';
import 'routes/routes_name.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData( 
            useMaterial3: true, 
            textTheme: GoogleFonts.notoSansJavaneseTextTheme()
            ),
        debugShowCheckedModeBanner: false,
        title: 'GuideWay',
        onGenerateRoute: Routes.generateRoute,
        initialRoute: initScreen == 0 || initScreen == null
            ? RoutesName.onBoarding
            : RoutesName.home);
  }
}
