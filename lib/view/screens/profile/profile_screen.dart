import 'package:flutter/material.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/text_field/my_text_field.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Profile"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              MyTextField(
                  header: "Username",
                  controller: usernameController,
                  hint: "Username"),
              MyTextField(
                  header: "Full Name",
                  controller: fullnameController,
                  hint: "Full Name"),
              MyTextField(
                  header: "Email", controller: emailController, hint: "Email"),
              MyTextField(
                  header: "DOB",
                  controller: dobController,
                  hint: "Date of Birth"),
              const SizedBox(height: 40),
              MyElevatedButton(title: "Update", onTap: () {})
            ])));
  }
}
