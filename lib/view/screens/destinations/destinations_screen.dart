import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/destination/destination.dart';
import '../../../view_models/destination/destination_view_model.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/error_container/error_container.dart';
import '../../widgets/image_container/image_container.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../detail/detail_screen.dart';

class DestinationsScreen extends StatelessWidget {
  DestinationsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Destinations"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<DestinationViewModel>(
                    builder: (context, value, child) {
                  return StreamBuilder<List<DestinationModel>>(
                      stream: value.getDestinations(userViewModel.countryId!),
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
                                final destination = snapshot.data![index];

                                return ImageContainer(
                                    name: destination.name,
                                    description: destination.description,
                                    image: destination.thumnailImage,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                      title: destination.name,
                                                      description: destination
                                                          .description,
                                                      images:
                                                          destination.images,
                                                      latitude: destination
                                                          .latitude
                                                          .toString(),
                                                      longitude: destination
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
