import 'package:flutter/material.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class DestinationsScreen extends StatelessWidget {
  DestinationsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey, context, title: "Destionations"),
    );
  }
}