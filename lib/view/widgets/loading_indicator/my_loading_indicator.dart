import 'package:flutter/material.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/style.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 50,
            height: 50,
            child: Stack(alignment: Alignment.center, children: [
              Image.asset(guideWayIcon,
                  fit: BoxFit.cover, height: 30, width: 30),
              const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primary),
                  strokeWidth: 0.7)
            ])));
  }
}
