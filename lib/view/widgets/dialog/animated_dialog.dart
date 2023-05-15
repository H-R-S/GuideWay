import 'package:flutter/material.dart';

Future AnimatedDialog(
    {Offset? endOffSet = const Offset(0, .44),
    required BuildContext context,
    required Widget child}) {
  return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, 1), end: endOffSet);

        return SlideTransition(
            position: tween.animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
            child: child);
      },
      barrierDismissible: true,
      barrierLabel: "Get Started",
      pageBuilder: (context, _, __) {
        return Dialog(elevation: 0, child: child);
      });
}
