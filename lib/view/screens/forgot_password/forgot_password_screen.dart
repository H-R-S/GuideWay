import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/dialog/animated_dialog.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/dialog/forgot_dialog.dart';
import '../../widgets/tag/main_tag.dart';
import '../../widgets/text_field/my_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: BackButton(onPressed: () {
          Navigator.pop(context);
        })),
        body: Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              const MainTag(
                  title: "Forgot Password",
                  subTitle: "Enter your email account to reset your password"),
              const SizedBox(height: 40),
              MyTextField(controller: emailController, hint: "Email"),
              const SizedBox(height: 40),
              MyElevatedButton(
                  title: "Reset Password",
                  onTap: () {
                    AnimatedDialog(context: context, 
                    endOffSet: const Offset(0,0),
                    child: const ForgotDialog());
                  })
            ])));
  }
}
