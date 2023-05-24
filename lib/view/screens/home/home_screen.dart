import 'package:flutter/material.dart';
import '../../../resources/data/data.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/info_container/info_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, isHome: true),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: width * 0.45,
                                  crossAxisSpacing: 30,
                                  mainAxisSpacing: 30,
                                  crossAxisCount: 2),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return InfoContainer(
                                title: data[index]["title"],
                                icon: data[index]["icon"],
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, data[index]["route"]);
                                });
                          }),
                      const SizedBox(height: 40)
                    ]))));
  }
}
