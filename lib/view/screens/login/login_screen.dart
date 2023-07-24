import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/validator/validator.dart';
import '../../../theme/theme_provider.dart';
import '../../../view_models/auth/auth_view_model.dart';
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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20).copyWith(top: 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(guideWayIcon, height: 40),
                                const SizedBox(width: 20),
                                Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Text("GuideWay",
                                        style: TextStyle(
                                            color: isDark ? Colors.white : null,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)))
                              ]),
                          const SizedBox(height: 20),
                          const MainTag(
                              title: "Sign in now",
                              subTitle: "Please sign in to continue our app"),
                          const SizedBox(height: 20),
                          MyTextField(
                              validator: (value) =>
                                  Validator.validateEmail(value),
                              controller: emailController,
                              hint: "Email"),
                          MyTextField(
                              validator: (value) =>
                                  Validator.validatePassword(value),
                              isPassword: true,
                              isVisible: true,
                              controller: passwordController,
                              hint: "Password"),
                          const ForgotPasswordButton(),
                          const SizedBox(height: 20),
                          MyElevatedButton(
                              isLoading: authViewModel.loading,
                              title: "Sign In",
                              onTap: () {
                                final isValidate =
                                    formKey.currentState!.validate();

                                if (isValidate) {
                                  authViewModel.signInWithEmail(
                                      context: context,
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                                }
                              }),
                          const SignUpButton(),
                          const SizedBox(height: 10),
                          Text("or continue with",
                              style: TextStyle(
                                  color: isDark ? Colors.white : null)),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyCircleButton(
                                    icon: googleIcon,
                                    onTap: () {
                                      authViewModel.signInWithGoogle(context);
                                    }),
                                MyCircleButton(
                                    icon: facebookIcon,
                                    onTap: () {
                                      authViewModel.signInWithFacebook(context);
                                    }),
                                MyCircleButton(
                                    icon: twitterIcon,
                                    onTap: () {
                                      authViewModel.signInWithTwitter(context);
                                    })
                              ])
                        ])))));
  }
}
