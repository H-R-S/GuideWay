import 'package:flutter/material.dart';
import 'package:guide_way/resources/data/destinations.dart';
import 'package:guide_way/routes/routes.dart';
import 'package:guide_way/view/screens/detail/detail_screen.dart';
import 'package:guide_way/view/widgets/image_container/image_container.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class DestinationsScreen extends StatelessWidget {
  DestinationsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Destionations"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: destinations.length,
                      itemBuilder: (context, index) {
                        return ImageContainer(
                            name: destinations[index]["name"],
                            description: destinations[index]["description"],
                            image: destinations[index]["image"],
                            onTap: () {
                              Navigator.push(context, getPageRoute(DetailScreen(
                                title: destinations[index]["name"],
                                description: destinations[index]["description"]
                              )));
                            });
                      })
                ]))));
  }
}
