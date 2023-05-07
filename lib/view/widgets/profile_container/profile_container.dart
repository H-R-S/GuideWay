import 'package:flutter/material.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/style.dart';

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
    const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: primaryLight,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 4))
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(personIcon)),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: style),
            const SizedBox(height: 5),
            Text(userName,
                style: style.copyWith(fontWeight: FontWeight.normal)),
            const SizedBox(height: 5),
            Text(email, style: style)
          ])
        ]));
  }
}
