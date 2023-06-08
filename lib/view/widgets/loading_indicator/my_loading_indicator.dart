import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: primary));
  }
}
