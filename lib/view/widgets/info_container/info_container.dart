import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String icon;
  final Function() onTap;
  final bool isDisable;

  const InfoContainer(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.isDisable = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisable ? null : onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.circular(20)),
          child: FittedBox(
              child: Column(children: [
            Stack(alignment: Alignment.center, children: [
              if (isDisable)
                const Positioned(
                    child: Text("Coming Soon",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              Opacity(
                  opacity: isDisable ? 0.3 : 1,
                  child: Image.asset(icon, height: 100, fit: BoxFit.fitHeight)),
            ]),
            const SizedBox(height: 10),
            Opacity(
              opacity: isDisable ? 0.3 : 1,
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ]))),
    );
  }
}
