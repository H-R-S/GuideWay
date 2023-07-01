import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/style.dart';
import '../../../services/launch/launch_service.dart';
import '../../../theme/theme_provider.dart';
import '../button/my_elevated_button.dart';

class MessengerContainer extends StatelessWidget {
  const MessengerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    bool isDark = theme.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontWeight: FontWeight.bold,
        fontSize: 20);

    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: isDark ? dark : null,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Image.asset(guideWayIcon, height: 50),
                Row(children: [
                  PopupMenuButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      position: PopupMenuPosition.under,
                      icon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: primary, shape: BoxShape.circle),
                          child: const Icon(Icons.more_horiz,
                              color: Colors.white)),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                child: TextButton(
                                    child: Text("Visit Facebook Page",
                                        style: TextStyle(
                                            color: isDark ? Colors.white : null,
                                            fontSize: 14)),
                                    onPressed: () {
                                      LaunchLink.launchFacebookPage();
                                    }))
                          ]),
                  const SizedBox(width: 5),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: light, shape: BoxShape.circle),
                          child: const Icon(Icons.remove, color: Colors.white)))
                ])
              ]),
              const SizedBox(height: 40),
              Text("Chat with GuideWay", style: style),
              Text("Hi! How can we help you?",
                  style: style.copyWith(
                      fontSize: 16, fontWeight: FontWeight.normal)),
              const SizedBox(height: 40),
              MyElevatedButton(
                  onTap: () {
                    LaunchLink.launchMessengerChat();
                  },
                  title: "Start Chat"),
              const SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(isDark ? messengerIcon : messengerIconDark,
                    height: 20),
                const SizedBox(width: 5),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Powered by Messenger",
                        style: style.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal)))
              ])
            ]));
  }
}
