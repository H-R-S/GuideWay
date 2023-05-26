import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String? name, description, image, city;
  final Function() onTap;

  const ImageContainer(
      {super.key,
      required this.name,
      this.description,
      this.city,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
            onTap: onTap,
            child: Container(
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
                child: Row(children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      child: SizedBox(
                          width: 120,
                          height: 150,
                          child: Image.asset(image ?? "", fit: BoxFit.cover))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name ?? "", style: style),
                                const SizedBox(height: 10),
                                if (description != null)
                                  Text(description ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: style.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16)),
                                if (city != null)
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.location_on,
                                            color: Colors.grey),
                                        const SizedBox(width: 2),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(city ?? "",
                                                style: style.copyWith(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 16)))
                                      ])
                              ])))
                ]))));
  }
}
