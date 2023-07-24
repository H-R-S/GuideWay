import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../models/country/country_model.dart';
import '../../../models/user/user_model.dart';
import '../../../resources/data/countries.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.8395749, 67.0823143),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Location"),
        body: Consumer<UserViewModel>(builder: (context, value, child) {
          return FutureBuilder<UserModel?>(
              future: value.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      });
                }
                if (snapshot.hasData) {
                  final user = snapshot.data!;

                  CountryModel? userCountry = countries
                      .firstWhere((country) => country.id == user.countryId);

                  CameraPosition userLoc = CameraPosition(
                    target: LatLng(userCountry.latitude!.toDouble(),
                        userCountry.longitude!.toDouble()),
                    zoom: 14.4746,
                  );

                  return GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: userLoc,
                      markers: {
                        Marker(
                            markerId: const MarkerId("markerId"),
                            infoWindow: InfoWindow(
                                title:
                                    "${userCountry.capital} ,${userCountry.name}"),
                            icon: BitmapDescriptor.defaultMarker,
                            position: LatLng(userCountry.latitude!.toDouble(),
                                userCountry.longitude!.toDouble()))
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      });
                } else {
                  return const MyLoadingIndicator();
                }
              });
        }));
  }
}
