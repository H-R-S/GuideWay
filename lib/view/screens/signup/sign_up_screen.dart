import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../routes/routes_name.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/button/my_circle_button.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/button/sign_in_button.dart';
import '../../widgets/tag/main_tag.dart';
import '../../widgets/text_field/my_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: BackButton(onPressed: () {
                  Navigator.pop(context);
                })),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20).copyWith(top: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MainTag(
                              title: "Sign Up now",
                              subTitle:
                                  "Please fill the details and create account"),
                          const SizedBox(height: 20),
                          MyTextField(
                              controller: usernameController, hint: "Username"),
                          MyTextField(
                              controller: emailController, hint: "Email"),
                          MyTextField(
                              isPassword: true,
                              isVisible: true,
                              controller: passwordController,
                              hint: "Password"),
                          const SizedBox(height: 20),
                          MyElevatedButton(
                              title: "Sign Up",
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, RoutesName.country);
                              }),
                          const SignInButton(),
                          const SizedBox(height: 20),
                          Text("or continue with",
                              style: TextStyle(
                                  color: isDark ? Colors.white : null)),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyCircleButton(icon: googleIcon, onTap: () {}),
                                MyCircleButton(
                                    icon: facebookIcon, onTap: () {}),
                                MyCircleButton(icon: twitterIcon, onTap: () {})
                              ])
                        ])))));
  }
}