import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/rule/rule_model.dart';
import '../../../theme/theme_provider.dart';
import '../../../view_models/rule/rule_view_model.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';

class TransportRulesScreen extends StatelessWidget {
  TransportRulesScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController rulesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    // final ruleViewModel = Provider.of<RuleViewModel>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 18,
        fontWeight: FontWeight.normal);

    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Transport Rules"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child:
                    Consumer<RuleViewModel>(builder: (context, value, child) {
                  return StreamBuilder<List<RuleModel>>(
                      stream: value.getRules(
                          context, "Transport Rules", userViewModel.countryId),
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
                                final rule = snapshot.data![index];

                                return Column(children: [
                                  Text(rule.description ?? "", style: style),
                                  const SizedBox(height: 20),
                                  Text(rule.rules ?? "", style: style)
                                ]);
                              });
                        } else {
                          return const MyLoadingIndicator();
                        }
                      });
                }))));
  }
}

//     return Scaffold(
//         appBar: MyAppBar(scaffoldKey, context, title: "Transport Rules"),
//         body: SingleChildScrollView(
//             child: Padding(
//           padding: const EdgeInsets.all(20),
//       //     child: Column(children: [
//       //       MyTextField(dropDownList: const [
//       //         "Job Timings",
//       //         "Airport Rules",
//       //         "Transport Rules",
//       //         "Driving Rules"
//       //       ], controller: titleController, hint: "Title"),
//       //       MyTextField(controller: descriptionController, hint: "Description"),
//       //       MyTextField(controller: rulesController, hint: "Rules"),
//       //       MyElevatedButton(
//       //           isLoading: ruleViewModel.loading,
//       //           title: "Add",
//       //           onTap: () {
//       //             ruleViewModel.addRules(
//       //                 context,
//       //                 RuleModel(
//       //                     id: Timestamp.now().microsecondsSinceEpoch,
//       //                     title: titleController.text.trim(),
//       //                     description: descriptionController.text.trim(),
//       //                     rules: rulesController.text.trim(),
//       //                     country: CountryModel(
//       //                         id: 47,
//       // name: "Norway",
//       // flag: "https://firebasestorage.googleapis.com/v0/b/guide-wayy.appspot.com/o/flags%2Fnorway_flag.png?alt=media&token=cc32def3-cb1a-4c2b-a389-9c2684295a9e",
//       // dialingCode: "+47",
//       // capital: "Oslo",
//       // latitude: 59.9139,
//       // longitude: 10.7522,
//       // currency: "Norwegian Krone",
//       // currencyCode: "NOK",
//       // domain: ".no")));
//       //           })
//       //     ]),
//           child:
//               Consumer<RuleViewModel>(builder: (context, value, child) {
//             return StreamBuilder<List<RuleModel>>(
//                 stream: value.getRules(context, "Transport Rules"),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     debugPrint(snapshot.error.toString());
//                     return Container();
//                   } else if (snapshot.hasData) {
//                     return ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) {
//                           final rule = snapshot.data![index];

//                           return Column(children: [
//                             Text(rule.description ?? "", style: style),
//                             const SizedBox(height: 20),
//                             Text(rule.rules ?? "", style: style)
//                           ]);
//                         });
//                   } else {
//                     return const MyLoadingIndicator();
//                   }
//                 });
//           })
//         )));
//   }
// }
