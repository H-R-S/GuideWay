import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../view_models/feedback/feedback_view_model.dart';
import '../../widgets/add_feedback_container/add_feedback_container.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/error_container/error_container.dart';
import '../../widgets/feedback_container/feedback_container.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';

class FeedBackScreen extends StatelessWidget {
  FeedBackScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController reasonController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final feedBackViewModel = Provider.of<FeedBackViewModel>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: primary,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => AddFeedBackContainer(
                      reasonController: reasonController,
                      feedbackController: feedbackController,
                      isLoading: feedBackViewModel.loading,
                      onTap: () {
                        feedBackViewModel.addFeedBack(context,
                            reasonController.text, feedbackController.text);
                      }));
            },
            child: const Icon(Icons.add)),
        appBar: MyAppBar(scaffoldKey, context, title: "FeedBack"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Consumer<FeedBackViewModel>(builder: (context, value, child) {
              return StreamBuilder(
                  stream: value.getFeedBacks(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      debugPrint(snapshot.error.toString());
                      return ErrorContainer(
                          description: snapshot.error.toString());
                    }

                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final feedBack = snapshot.data![index];

                            return FeedBackContainer(
                                name: feedBack.user["fullName"],
                                dateTime:
                                    feedBack.timestamp!.toDate().toString(),
                                reason: feedBack.reason ?? "",
                                feedback: feedBack.feedback ?? "");
                          });
                    } else {
                      return const MyLoadingIndicator();
                    }
                  });
            })));
  }
}
