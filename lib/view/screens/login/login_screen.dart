import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../routes/routes_name.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/button/forgot_password_button.dart';
import '../../widgets/button/my_circle_button.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/button/sign_up_button.dart';
import '../../widgets/tag/main_tag.dart';
import '../../widgets/text_field/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 50),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(guideWayIcon, height: 50),
                const SizedBox(width: 20),
                Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Text("GuideWay",
                        style: TextStyle(
                            color: isDark ? Colors.white : null,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)))
              ]),
              const SizedBox(height: 20),
              const MainTag(
                  title: "Sign in now",
                  subTitle: "Please sign in to continue our app"),
              const SizedBox(height: 20),
              MyTextField(controller: emailController, hint: "Email"),
              MyTextField(
                  isPassword: true,
                  isVisible: true,
                  controller: passwordController,
                  hint: "Password"),
              const ForgotPasswordButton(),
              const SizedBox(height: 20),
              MyElevatedButton(
                  title: "Sign In",
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RoutesName.country);
                  }),
              const SignUpButton(),
              const SizedBox(height: 10),
              Text("or continue with",
                  style: TextStyle(color: isDark ? Colors.white : null)),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                MyCircleButton(icon: googleIcon, onTap: () {}),
                MyCircleButton(icon: facebookIcon, onTap: () {}),
                MyCircleButton(icon: twitterIcon, onTap: () {})
              ])
            ])));
  }
}
