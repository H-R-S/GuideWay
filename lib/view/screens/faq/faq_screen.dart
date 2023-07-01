import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/faq/faq_model.dart';
import '../../../view_models/faq/faq_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/messenger_button..dart';
import '../../widgets/faq_container/faq_container.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../widgets/messenger_container/messenger_container.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: MessengerButton(onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => const MessengerContainer());
        }),
        appBar: MyAppBar(scaffoldKey, context, title: "FAQ"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<FAQViewModel>(builder: (context, value, child) {
                  return StreamBuilder<List<FAQModel>>(
                      stream: value.getFAQs(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          debugPrint(snapshot.error.toString());
                          return Container();
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final faq = snapshot.data![index];

                                return FAQContainer(
                                    question: faq.question ?? "",
                                    answer: faq.answer ?? "");
                              });
                        } else {
                          return const MyLoadingIndicator();
                        }
                      });
                }))));
  }
}
