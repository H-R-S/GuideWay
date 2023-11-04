import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

class ProfileContainer extends StatelessWidget {
  final String name, userName, email;
  final Function() onTap;

  const ProfileContainer(
      {super.key,
      required this.name,
      required this.userName,
      required this.email,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 18,
        fontWeight: FontWeight.bold);

    return InkWell(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: isDark ? dark : primaryLight,
                boxShadow: [
                  BoxShadow(
                      color: isDark ? Colors.black12 : Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 4))
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(personIcon)),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: style),
                      const SizedBox(height: 5),
                      Text(userName,
                          style: style.copyWith(fontWeight: FontWeight.normal)),
                      const SizedBox(height: 5),
                      Text(email, overflow: TextOverflow.ellipsis, style: style)
                    ]),
              )
            ])));
  }
}
