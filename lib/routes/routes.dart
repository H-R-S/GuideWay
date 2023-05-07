import 'package:flutter/material.dart';
import '../home.dart';
import '../view/screens/country/country_screen.dart';
import '../view/screens/forgot_password/forgot_password_screen.dart';
import '../view/screens/login/login_screen.dart';
import '../view/screens/on_boarding/on_boarding_screen.dart';
import '../view/screens/signup/sign_up_screen.dart';
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

      default:
        return getPageRoute(LoginScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
