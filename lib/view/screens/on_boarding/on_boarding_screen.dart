import 'package:flutter/material.dart';
import '../../../resources/constants/images.dart';
import '../../widgets/on_boarding/model/on_boarding_model.dart';
import '../../widgets/on_boarding/on_boarding_widget.dart';
import '../login/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final List<OnBoardingModel> list = [
    OnBoardingModel(
        title: "Explore the world like a local with GuideWay!",
        subTitle:
            "Discover hidden gems and immerse yourself in the culture of your destination with the help of our expert tour guides.",
        image: onBoarding02),
    OnBoardingModel(
        title: "Travel made easy with GuideWay!",
        subTitle:
            'Plan your dream vacation, book experiences with ease, and leave the stress of travel planning behind.',
        image: onBoarding02),
    OnBoardingModel(
        title: "Join the journey with GuideWay!",
        subTitle:
            'Connect with like-minded travelers, share your experiences, and make memories that last a lifetime with GuideWay`s vibrant community.',
        image: onBoarding02)
  ];

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
        contentList: list,
        onTapLast: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
  }
}
