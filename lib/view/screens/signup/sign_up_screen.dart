import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/validator/validator.dart';
import '../../../theme/theme_provider.dart';
import '../../../view_models/auth/auth_view_model.dart';
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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: BackButton(onPressed: () {
              Navigator.pop(context);
            })),
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
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
                              validator: (value) =>
                                  Validator.validateForm(value, "username"),
                              controller: usernameController,
                              hint: "Username"),
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
                          const SizedBox(height: 20),
                          MyElevatedButton(
                              isLoading: authViewModel.loading,
                              title: "Sign Up",
                              onTap: () {
                                final isValidate =
                                    formKey.currentState!.validate();

                                if (isValidate) {
                                  authViewModel.signUpWithEmail(
                                      context: context,
                                      username: usernameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                                }
                              }),
                          const SignInButton(),
                          const SizedBox(height: 10),
                          Text("or continue with",
                              style: TextStyle(
                                  color: isDark ? Colors.white : null)),
                          const SizedBox(height: 10),
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
