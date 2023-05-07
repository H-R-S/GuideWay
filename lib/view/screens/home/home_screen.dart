import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/app_bar/my_app_bar.dart';
import '../../../resources/data/data.dart';
import '../../widgets/info_container/info_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20).copyWith(top: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: width * 0.4,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                            crossAxisCount: 2),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return InfoContainer(
                              isDisable: data[index]["isDisable"],
                              title: data[index]["title"],
                              icon: data[index]["icon"],
                              onTap: () {});
                        }),
                    const SizedBox(height: 40)
                  ])),
        ));
  }
}
