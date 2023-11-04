import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_models/auth/auth_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/text_field/my_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController lastPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Change Password"),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                MyTextField(
                    header: "Last Password",
                    isRequired: true,
                    isPassword: true,
                    isVisible: true,
                    controller: lastPasswordController,
                    hint: "Last Password"),
                MyTextField(
                    header: "New Password",
                    isRequired: true,
                    isPassword: true,
                    isVisible: true,
                    controller: newPasswordController,
                    hint: "New Password"),
                MyTextField(
                    header: "Confirm Password",
                    isRequired: true,
                    isPassword: true,
                    isVisible: true,
                    controller: confirmPasswordController,
                    hint: "Confirm Password"),
                const SizedBox(height: 40),
                MyElevatedButton(
                    isLoading: authViewModel.loading,
                    title: "Change Password",
                    onTap: () {
                      authViewModel.changePassword(
                          context,
                          lastPasswordController.text.trim(),
                          newPasswordController.text.trim());
                    })
              ])),
        ));
  }
}
