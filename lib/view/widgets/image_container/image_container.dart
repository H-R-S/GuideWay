import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/style.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 18,
        fontWeight: FontWeight.bold);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
            onTap: onTap,
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: isDark ? dark : Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: isDark ? Colors.black12 : Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 4))
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
                          child:
                              Image.network(image ?? "", fit: BoxFit.cover))),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: style),
                                // const SizedBox(height: 5),
                                if (description != null)
                                  Text(description ?? "",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: style.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14)),
                                if (city != null)
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.location_on,
                                            color: isDark
                                                ? Colors.white70
                                                : Colors.grey),
                                        const SizedBox(width: 2),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(city ?? "",
                                                style: style.copyWith(
                                                    color: isDark
                                                        ? Colors.white70
                                                        : Colors.grey.shade700,
                                                    fontSize: 16)))
                                      ])
                              ])))
                ]))));
  }
}
