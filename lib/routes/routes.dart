import 'package:flutter/material.dart';
import '../home.dart';
import '../view/screens/country/country_screen.dart';
import '../view/screens/currency/currency_screen.dart';
import '../view/screens/destinations/destinations_screen.dart';
import '../view/screens/forgot_password/forgot_password_screen.dart';
import '../view/screens/location/location_screen.dart';
import '../view/screens/login/login_screen.dart';
import '../view/screens/on_boarding/on_boarding_screen.dart';
import '../view/screens/prayer_timings/prayer_timings_screen.dart';
import '../view/screens/qibla_direction/qibla_direction_screen.dart';
import '../view/screens/signup/sign_up_screen.dart';
import '../view/screens/translate/translate_screen.dart';
import '../view/screens/universities/universities_screen.dart';
import '../view/screens/weather/weather_screen.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoarding:
        return getPageRoute(OnBoardingScreen());

      case RoutesName.login:
        return getPageRoute(LoginScreen());

      case RoutesName.signup:
        return getPageRoute(SignUpScreen());

      case RoutesName.forgotPassword:
        return getPageRoute(ForgotPasswordScreen());

      case RoutesName.home:
        return getPageRoute(const Home());

      case RoutesName.country:
        return getPageRoute(const CountryScreen());
      
      case RoutesName.universities:
        return getPageRoute(UniversitiesScreen());

      case RoutesName.weather:
        return getPageRoute(WeatherScreen());

      case RoutesName.destinations:
        return getPageRoute(DestinationsScreen());

      case RoutesName.location:
        return getPageRoute(LocationScreen());

      case RoutesName.currency:
        return getPageRoute(CurrencyScreen());

      case RoutesName.translate:
        return getPageRoute(TranslateScreen());

      case RoutesName.prayerTimings:
        return getPageRoute(PrayerTimingsScreen());

      case RoutesName.qiblaDirection:
        return getPageRoute(QiblaDirectionScreen());

      default:
        return getPageRoute(LoginScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
