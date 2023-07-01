import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../theme/theme_provider.dart';

class MessengerButton extends StatelessWidget {
  final Function() onTap;

  const MessengerButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    bool isDark = theme.currentTheme == ThemeData.dark();

    return InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: isDark ? Colors.white : Colors.white,
                shape: BoxShape.circle),
            child: Image.asset(isDark ? messengerIconDark : messengerIcon,
                height: 50)));
  }
}
