import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provider.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/google_map/google_map_container.dart';
import '../../widgets/image_slider/image_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final String? title, description, website, latitude, longitude;
  final List<dynamic>? images;
  final bool isWebsite;

  DetailScreen(
      {super.key,
      this.isWebsite = false,
      this.title,
      this.images,
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
        fontSize: 18,
        fontWeight: FontWeight.normal);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: title),
        persistentFooterButtons: [
          if (isWebsite)
            Padding(
                padding: const EdgeInsets.all(10),
                child: MyElevatedButton(
                    title: "Visit Website",
                    onTap: () => _launchInWebView(website ?? "www.google.com")))
        ],
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ImageSlider(controller: controller, items: images),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!,
                        style: style.copyWith(fontWeight: FontWeight.bold)),
                    if (description != null)
                      Text(description!, style: style.copyWith(fontSize: 16)),
                    const SizedBox(height: 20),
                    Text("Location:",
                        style: style.copyWith(fontWeight: FontWeight.bold)),
                    GoogleMapContainer(
                        title: title!,
                        latitude: double.parse(latitude!),
                        longitude: double.parse(longitude!)),
                    const SizedBox(height: 40)
                  ]))
        ])));
  }

  Future<void> _launchInWebView(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
