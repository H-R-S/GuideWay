import 'package:flutter/material.dart';
import '../../../resources/data/faq.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/faq_container/faq_container.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "FAQ"),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: faq.length,
                  itemBuilder: (context, index) {
                    return FAQContainer(
                        question: faq[index]["question"],
                        answer: faq[index]["answer"]);
                  })),
        ));
  }
}
