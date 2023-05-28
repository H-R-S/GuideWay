import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/button/my_elevated_button.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/images.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/google_map/google_map_container.dart';
import '../../widgets/image_slider/image_slider.dart';

class DetailScreen extends StatelessWidget {
  final String? title, description, website, latitude, longitude;
  final bool isWebsite;

  DetailScreen(
      {super.key,
      this.isWebsite = false,
      this.title,
      this.description,
      this.website,
      this.latitude,
      this.longitude});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 20,
        fontWeight: FontWeight.normal);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: title),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: isWebsite
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: MyElevatedButton(title: "Visit Website", onTap: () {}),
              )
            : null,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ImageSlider(controller: controller, items: const [
            londonImage,
            edinburghImage,
            stonehengeImage,
            lakeDistrictImage
          ]),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!,
                        style: style.copyWith(fontWeight: FontWeight.bold)),
                    if (description != null)
                      Text(description!, style: style.copyWith(fontSize: 18)),
                    const SizedBox(height: 20),
                    Text("Location:",
                        style: style.copyWith(fontWeight: FontWeight.bold)),
                    GoogleMapContainer(
                        title: title!,
                        latitude: 24.8395749,
                        longitude: 67.0823143),
                    const SizedBox(height: 40)
                  ]))
        ])));
  }
}
