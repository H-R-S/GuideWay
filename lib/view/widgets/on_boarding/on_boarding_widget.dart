import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../button/my_elevated_button.dart';
import 'model/on_boarding_model.dart';
import 'widgets/dot_indicator.dart';
import 'widgets/on_board_container.dart';

class OnBoardingWidget extends StatefulWidget {
  final List<OnBoardingModel> contentList;
  final Function() onTapLast;

  const OnBoardingWidget(
      {super.key, required this.contentList, required this.onTapLast});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  PageController controller = PageController(initialPage: 0);

  int currentIndex = 0;
  bool isGetStarted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Expanded(
          child: PageView.builder(
              itemCount: widget.contentList.length,
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnBoardContainer(
                    title: widget.contentList[index].title,
                    subTitle: widget.contentList[index].subTitle,
                    image: widget.contentList[index].image);
              })),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TextButton(
            onPressed: () {
              controller.animateToPage(widget.contentList.length - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: const Text("SKIP",
                style: TextStyle(color: primary, fontWeight: FontWeight.bold))),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...List.generate(
              widget.contentList.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: DotIndicator(
                      onTap: () {
                        controller.animateToPage(index,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      isActive: index == currentIndex)))
        ]),
        TextButton(
            onPressed: () {
              if (currentIndex == widget.contentList.length - 1) {
                showGeneralDialog(
                    context: context,
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionBuilder:
                        (context, animation, secondaryAnimation, child) {
                      Tween<Offset> tween;
                      tween = Tween(
                          begin: const Offset(0, 1), end: const Offset(0, .44));

                      return SlideTransition(
                          position: tween.animate(CurvedAnimation(
                              parent: animation, curve: Curves.easeInOut)),
                          child: child);
                    },
                    barrierDismissible: true,
                    barrierLabel: "Get Started",
                    pageBuilder: (context, _, __) {
                      return Dialog(
                          elevation: 0,
                          child: SizedBox(
                              height: 60,
                              child: MyElevatedButton(
                                  title: "Get Started",
                                  onTap: widget.onTapLast)));
                    });
              } else {
                controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }
            },
            child: const Icon(Icons.arrow_forward, color: primary))
      ]),
      const SizedBox(height: 20)
    ])));
  }
}
