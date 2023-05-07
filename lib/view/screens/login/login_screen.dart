import 'package:flutter/material.dart';
import '../../../resources/constants/icons.dart';
import '../../widgets/button/forgot_password_button.dart';
import '../../widgets/button/my_circle_button.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/button/sign_up_button.dart';
import '../../widgets/tag/main_tag.dart';
import '../../widgets/text_field/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const MainTag(
                  title: "Sign in now",
                  subTitle: "Please sign in to continue our app"),
              const SizedBox(height: 40),
              MyTextField(controller: emailController, hint: "Email"),
              MyTextField(
                  isPassword: true,
                  isVisible: true,
                  controller: passwordController,
                  hint: "Password"),
              const ForgotPasswordButton(),
              const SizedBox(height: 40),
              MyElevatedButton(title: "Sign In", onTap: () {}),
              const SignUpButton(),
              const SizedBox(height: 40),
              const Text("or continue with"),
              const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                MyCircleButton(icon: googleIcon, onTap: () {}),
                MyCircleButton(icon: facebookIcon, onTap: () {}),
                MyCircleButton(icon: twitterIcon, onTap: () {})
              ])
            ])));
  }
}
