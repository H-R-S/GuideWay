import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/university/university_model.dart';
import '../../../view_models/university/university_view_model.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/error_container/error_container.dart';
import '../../widgets/image_container/image_container.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../detail/detail_screen.dart';

class UniversitiesScreen extends StatelessWidget {
  UniversitiesScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Universities"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<UniversityViewModel>(
                    builder: (context, value, child) {
                  return StreamBuilder<List<UniversityModel>>(
                      stream: value.getUniversities(userViewModel.countryId!),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          debugPrint(snapshot.error.toString());
                          return ErrorContainer(
                              description: snapshot.error.toString());
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final university = snapshot.data![index];

                                return ImageContainer(
                                    name: university.name,
                                    description: university.description,
                                    image: university.thumnailImage,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                      website:
                                                          university.website,
                                                      isWebsite:
                                                          university.website !=
                                                              null,
                                                      title: university.name,
                                                      description: university
                                                          .description,
                                                      images: university.images,
                                                      latitude: university
                                                          .latitude
                                                          .toString(),
                                                      longitude: university
                                                          .longitude
                                                          .toString())));
                                    });
                              });
                        } else {
                          return const MyLoadingIndicator();
                        }
                      });
                }))));
  }
}
