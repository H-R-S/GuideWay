import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guide_way/view_models/prayer/prayer_view_model.dart';
import 'package:guide_way/view_models/translate/translate_view_model.dart';
import 'package:guide_way/view_models/weather/weather_view_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/routes.dart';
import 'theme/theme_provider.dart';
import 'view/screens/login/login_screen.dart';
import 'view/screens/splash/splash_screen.dart';
import 'view/widgets/snack_bar/my_snack_bar.dart';
import 'view_models/auth/auth_view_model.dart';
import 'view_models/user/user_view_model.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          ChangeNotifierProvider(create: (context) => AuthViewModel()),
          ChangeNotifierProvider(create: (context) => UserViewModel()),          
          ChangeNotifierProvider(create: (context) => TranslateViewModel()),
          ChangeNotifierProvider(create: (context) => PrayerViewModel()),
          ChangeNotifierProvider(create: (context) => WeatherViewModel()),
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
                  home: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return MySnackBar(context, snapshot.error.toString());
                        } else if (snapshot.hasData) {
                          return const SplashScreen();
                        } else {
                          return LoginScreen();
                        }
                      }));
              // initialRoute: initScreen == 0 || initScreen == null
              //     ? RoutesName.onBoarding
              //     : RoutesName.home);
            }));
  }
}
