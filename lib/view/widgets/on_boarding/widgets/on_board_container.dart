import 'package:flutter/material.dart';

class OnBoardContainer extends StatelessWidget {
  final String? title, subTitle, image;

  const OnBoardContainer({super.key, this.title, this.subTitle, this.image});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

    return Column(children: [
      Container(
        height: 400,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: image != null
            ? ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Image.asset(image!, fit: BoxFit.cover))
            : const Placeholder(),
      ),
      const Spacer(),
      Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            if (title != null)
              Text(title!,
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 28)),
            const SizedBox(height: 20),
            if (subTitle != null)
              Text(subTitle!,
                  textAlign: TextAlign.center,
                  style: style.copyWith(color: Colors.grey.shade700))
          ])),
      const Spacer()
    ]);
  }
}
