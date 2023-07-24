import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/rule/rule_model.dart';
import '../../../theme/theme_provider.dart';
import '../../../view_models/rule/rule_view_model.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/error_container/error_container.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';

class AirportRulesScreen extends StatelessWidget {
  AirportRulesScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    final style = TextStyle(
        color: isDark ? Colors.white : null,
        fontSize: 18,
        fontWeight: FontWeight.normal);

    final userViewModel = Provider.of<UserViewModel>(context);

      return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Airport Rules"),
         body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child:
                    Consumer<RuleViewModel>(builder: (context, value, child) {
                  return StreamBuilder<List<RuleModel>>(
                      stream: value.getRules(context, "Airport Rules", userViewModel.countryId),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          debugPrint(snapshot.error.toString());
                          return ErrorContainer(
                            description: snapshot.error.toString());

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