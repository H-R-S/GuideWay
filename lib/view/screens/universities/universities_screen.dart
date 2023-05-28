import 'package:flutter/material.dart';
import 'package:guide_way/resources/data/universities.dart';
import 'package:guide_way/routes/routes.dart';
import 'package:guide_way/view/screens/detail/detail_screen.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/image_container/image_container.dart';

class UniversitiesScreen extends StatelessWidget {
  UniversitiesScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Universities"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: universities.length,
                      itemBuilder: (context, index) {
                        return ImageContainer(
                            name: universities[index]["name"],
                            city: universities[index]["city"],
                            image: universities[index]["image"],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  getPageRoute(DetailScreen(
                                      isWebsite: true,
                                      title: universities[index]["name"])));
                            });
                      })
                ]))));
  }
}
