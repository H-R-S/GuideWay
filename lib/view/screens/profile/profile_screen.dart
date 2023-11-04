import 'package:flutter/material.dart';
import 'package:guide_way/models/user/user_model.dart';
import 'package:guide_way/view_models/user/user_view_model.dart';
import 'package:provider/provider.dart';
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
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<UserViewModel>(builder: (context, value, child) {
                return FutureBuilder<UserModel?>(
                    future: value.getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        debugPrint(snapshot.error.toString());
                        return Container();
                      } else if (snapshot.hasData) {
                        final user = snapshot.data!;

                        usernameController.value = usernameController.value
                            .copyWith(text: user.username);
                        emailController.value =
                            emailController.value.copyWith(text: user.email);
                        emailController.value =
                            emailController.value.copyWith(text: user.email);
                        dobController.value =
                            dobController.value.copyWith(text: user.dob);

                        return Column(children: [
                          MyTextField(
                              header: "Username",
                              controller: usernameController,
                              hint: "Username"),
                          MyTextField(
                              header: "Full Name",
                              controller: fullnameController,
                              hint: "Full Name"),
                          MyTextField(
                              isReadable: true,
                              header: "Email",
                              controller: emailController,
                              hint: "Email"),
                          MyTextField(
                              header: "DOB",
                              controller: dobController,
                              hint: "Date of Birth"),
                          const SizedBox(height: 40),
                          MyElevatedButton(
                              isLoading: value.loading,
                              title: "Update",
                              onTap: () {
                                value.updateUserInfo(
                                    context,
                                    UserModel(
                                        username:
                                            usernameController.text.trim(),
                                        fullName:
                                            fullnameController.text.trim(),
                                        dob: dobController.text.trim()));
                              })
                        ]);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    });
              })),
        ));
  }
}
