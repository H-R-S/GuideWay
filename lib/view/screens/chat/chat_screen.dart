import 'package:flutter/material.dart';
import 'package:guide_way/resources/constants/icons.dart';
import 'package:guide_way/view/widgets/app_bar/my_app_bar.dart';
import 'package:guide_way/view/widgets/text_field/my_text_field.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "GuideGPT"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
            height: 100,
            margin: const EdgeInsets.all(10).copyWith(bottom: 0),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: MyTextField(
                controller: chatController,
                hint: "Ask a question")),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Column(children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: const Row(children: [
                          Icon(Icons.chat, color: Colors.grey),
                          SizedBox(width: 20),
                          Text("Hi")
                        ])),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: Row(children: [
                          Image.asset(guideWayIcon, height: 30),
                          SizedBox(width: 20),
                          Text("How I can Asset you.")
                        ])),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: const Row(children: [
                          Icon(Icons.chat, color: Colors.grey),
                          SizedBox(width: 20),
                          Text("What is GuideGPT?")
                        ])),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: Row(children: [
                          Image.asset(guideWayIcon, height: 30),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                                  "GuideGPT is an advanced language model developed by OpenAI that can generate human-like text based on a given input prompt. It can be used for various applications involving conversational agents, assistance, dialogue systems, and more. However, it doesn't possess real-world knowledge and generates responses based on patterns learned during training.",
                                  overflow: TextOverflow.clip))
                        ])),
                    const SizedBox(height: 100)
                  ])
                ]))));
  }
}
