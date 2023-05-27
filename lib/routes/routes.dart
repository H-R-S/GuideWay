import 'package:flutter/material.dart';
import '../home.dart';
import '../view/screens/airport_rules/airport_rules_screen.dart';
import '../view/screens/change_password/change_password_screen.dart';
import '../view/screens/country/country_screen.dart';
import '../view/screens/currency/currency_screen.dart';
import '../view/screens/destinations/destinations_screen.dart';
import '../view/screens/driving_rules/driving_rules_screen.dart';
import '../view/screens/feedback/feedback_screen.dart';
import '../view/screens/forgot_password/forgot_password_screen.dart';
import '../view/screens/job_timings/job_timings_screen.dart';
import '../view/screens/location/location_screen.dart';
import '../view/screens/login/login_screen.dart';
import '../view/screens/notifications/notifications_screen.dart';
import '../view/screens/on_boarding/on_boarding_screen.dart';
import '../view/screens/prayer_timings/prayer_timings_screen.dart';
import '../view/screens/privacy_policy/privacy_policy_screen.dart';
import '../view/screens/profile/profile_screen.dart';
import '../view/screens/qibla_direction/qibla_direction_screen.dart';
import '../view/screens/signup/sign_up_screen.dart';
import '../view/screens/terms_and_condition/terms_and_condition_screen.dart';
import '../view/screens/translate/translate_screen.dart';
import '../view/screens/transport_rules/transport_rules_screen.dart';
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

      case RoutesName.profile:
        return getPageRoute(ProfileScreen());

      case RoutesName.changePassword:
        return getPageRoute(ChangePasswordScreen());

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

      case RoutesName.notifications:
        return getPageRoute(NotificationsScreen());

      case RoutesName.feedback:
        return getPageRoute(FeedBackScreen());

      case RoutesName.translate:
        return getPageRoute(TranslateScreen());

      case RoutesName.prayerTimings:
        return getPageRoute(PrayerTimingsScreen());

      case RoutesName.qiblaDirection:
        return getPageRoute(QiblaDirectionScreen());

      case RoutesName.transportRules:
        return getPageRoute(TransportRulesScreen());

      case RoutesName.drivingRules:
        return getPageRoute(DrivingRulesScreen());

      case RoutesName.airportRules:
        return getPageRoute(AirportRulesScreen());
      
      case RoutesName.jobTimings:
        return getPageRoute(JobTimingsScreen());
      
      case RoutesName.privacyPolicy:
        return getPageRoute(PrivacyPolicyScreen());

      case RoutesName.termsAndCondition:
        return getPageRoute(TermsAndConditionScreen());

      default:
        return getPageRoute(LoginScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
