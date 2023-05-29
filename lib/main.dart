import 'package:flutter/material.dart';
import 'package:guide_way/theme/theme_provider.dart';
import 'package:provider/provider.dart';
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
  final isDark = preferences.getBool("isDark") ?? false;
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatefulWidget {
  final bool isDark;

  const MyApp({super.key, this.isDark = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        child: ChangeNotifierProvider(
            create: (context) => ThemeProvider(isDark: widget.isDark),
            builder: (context, child) {
              final theme = Provider.of<ThemeProvider>(context);

              return MaterialApp(
                  theme: theme.currentTheme.copyWith(
                      useMaterial3: true,
                      textTheme: GoogleFonts.notoSansJavaneseTextTheme()),
                  debugShowCheckedModeBanner: false,
                  title: 'GuideWay',
                  onGenerateRoute: Routes.generateRoute,
                  initialRoute: initScreen == 0 || initScreen == null
                      ? RoutesName.onBoarding
                      : RoutesName.home);
            }));
  }
}
