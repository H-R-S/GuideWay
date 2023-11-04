import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../resources/constants/style.dart';
import '../../../resources/constants/images.dart';
import '../../../theme/theme_provider.dart';

class ImageSlider extends StatelessWidget {
  final CarouselController controller;
  final Function()? onTap;
  final dynamic items;
  final double height;
  final double viewportFraction;

  const ImageSlider(
      {super.key,
      required this.controller,
      this.onTap,
      this.height = 200,
      this.viewportFraction = 1,
      required this.items});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Stack(alignment: Alignment.center, children: [
      CarouselSlider.builder(
          carouselController: controller,
          itemCount: items.length,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
                onTap: onTap,
                child: Image.network(items[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) {
                  return Image.asset(emptyImage);
                }));
          },
          options: CarouselOptions(
              viewportFraction: viewportFraction,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              initialPage: 0,
              enlargeCenterPage: true,
              height: height,
              autoPlay: true)),
      Positioned(
          right: 10,
          child: InkWell(
              onTap: () => controller.nextPage(),
              child: CircleAvatar(
                  backgroundColor: isDark ? dark : primaryLight,
                  child: const Icon(Icons.arrow_forward_ios)))),
      Positioned(
          left: 10,
          child: InkWell(
            onTap: () => controller.previousPage(),
            child: CircleAvatar(
                backgroundColor: isDark ? dark : primaryLight,
                child: const Icon(Icons.arrow_back_ios_new)),
          ))
    ]);
  }
}
