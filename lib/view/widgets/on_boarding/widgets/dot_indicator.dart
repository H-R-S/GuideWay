import 'package:flutter/material.dart';
import '../../../../resources/constants/style.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  final Function()? onTap;

  const DotIndicator({super.key, this.isActive = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        child: InkWell(
            onTap: onTap,
            child: Container(
                height: isActive ? 15 : 10,
                width: isActive ? 35 : 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                    color: isActive ? primary : Colors.grey))));
  }
}
