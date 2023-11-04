import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/responses/status.dart';
import '../../../theme/theme_provider.dart';
import '../../../view_models/translate/translate_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../widgets/search_drop_down/search_drop_down.dart';
import '../../widgets/text_field/my_text_field.dart';

class TranslateScreen extends StatefulWidget {
  final String? text;

  const TranslateScreen({super.key, this.text});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  TranslateViewModel translateViewModel = TranslateViewModel();

  @override
  void initState() {
    translateViewModel.getLanguages();
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController textController = TextEditingController();
  final TextEditingController translateController = TextEditingController();
  final TextEditingController languageController = TextEditingController();

  bool isTranslate = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    textController.value = textController.value.copyWith(text: widget.text);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Translate"),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: ChangeNotifierProvider<TranslateViewModel>(
                  create: (context) => translateViewModel,
                  builder: (context, snapshot) {
                    return Column(children: [
                      MyTextField(
                          header: "Auto Detect",
                          minLine: 5,
                          controller: textController,
                          hint: "Enter Text"),
                      const SizedBox(height: 20),
                      Consumer<TranslateViewModel>(
                          builder: (context, value, child) {
                        switch (value.languages.status) {
                          case Status.ERROR:
                            debugPrint("error: ${value.languages.message}");
                            return Container();

                          case Status.COMPLETED:
                            return LanguageDropDown(
                                items: value.languages.data!,
                                hint: "Select Language",
                                onChanged: (value) {
                                  languageController.value = languageController
                                      .value
                                      .copyWith(text: value!.code);
                                });

                          default:
                            return const MyLoadingIndicator();
                        }
                      }),
                      const SizedBox(height: 20),
                      if (isTranslate)
                        Consumer<TranslateViewModel>(
                            builder: (context, value, child) {
                          debugPrint(value.translation.status.toString());
                          switch (value.translation.status) {
                            case Status.ERROR:
                              debugPrint("error: ${value.translation.message}");
                              return Container();

                            case Status.COMPLETED:
                              final translation = value
                                      .translation.data!.data!.translatedText ??
                                  "";

                              return Container(
                                  width: double.infinity,
                                  height: 150,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: isDark
                                              ? Colors.white
                                              : Colors.grey)),
                                  child: SingleChildScrollView(
                                      child: Text(translation,
                                          style: TextStyle(
                                              color:
                                                  isDark ? Colors.white : null,
                                              fontSize: 18))));

                            default:
                              return const MyLoadingIndicator();
                          }
                        }),
                      const SizedBox(height: 40),
                      MyElevatedButton(
                          title: "Translate",
                          onTap: () {
                            translateViewModel
                                .getTranslation(languageController.text,
                                    textController.text)
                                .then((value) {
                              setState(() {
                                isTranslate = true;
                              });
                            });
                          })
                    ]);
                  })),
        ));
  }
}
