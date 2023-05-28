import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapContainer extends StatelessWidget {
  final String title;
  final double latitude;
  final double longitude;

  GoogleMapContainer(
      {super.key,
      required this.title,
      required this.latitude,
      required this.longitude});

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GoogleMap(
                markers: {
                  Marker(
                      markerId: const MarkerId("markerId"),
                      infoWindow: InfoWindow(title: title),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(latitude, longitude))
                },
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(latitude, longitude), zoom: 14.4746),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                })));
  }
}
