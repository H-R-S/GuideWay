import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/responses/status.dart';
import '../../../view_models/currency/currency_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../widgets/search_drop_down/search_drop_down.dart';
import '../../widgets/text_field/my_text_field.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController fromCurrencyController = TextEditingController();
  final TextEditingController toCurrencyController = TextEditingController();
  final TextEditingController convertedCurrencyController =
      TextEditingController();

  CurrencyViewModel currencyViewModel = CurrencyViewModel();

  @override
  void initState() {
    currencyViewModel.getCurrencyList();
    super.initState();
  }

  bool isConverted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Currency"),
        body: ChangeNotifierProvider<CurrencyViewModel>(
            create: (context) => currencyViewModel,
            child:
                Consumer<CurrencyViewModel>(builder: (context, value, child) {
              switch (value.currencyList.status) {
                case Status.ERROR:
                  debugPrint(value.currencyList.message);
                  return Container();

                case Status.COMPLETED:
                  final currency = value.currencyList.data!;

                  return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [
                        MyTextField(
                            header: "Amount",
                            controller: amountController,
                            hint: "Amount"),
                        const SizedBox(height: 10),
                        CurrencyDropDown(
                            header: "From",
                            isRequired: true,
                            items: currency,
                            hint: "Select Currency",
                            onChanged: (value) {
                              fromCurrencyController.value =
                                  fromCurrencyController.value
                                      .copyWith(text: value!.symbol!);
                            }),
                        const SizedBox(height: 20),
                        CurrencyDropDown(
                            header: "To",
                            isRequired: true,
                            items: currency,
                            hint: "Select Currency",
                            onChanged: (value) {
                              toCurrencyController.value = toCurrencyController
                                  .value
                                  .copyWith(text: value!.symbol!);
                            }),
                        const SizedBox(height: 10),
                        if (isConverted)
                          Consumer<CurrencyViewModel>(
                              builder: (context, value, child) {
                            switch (value.convertCurrencyDetails.status) {
                              case Status.ERROR:
                                debugPrint(
                                    value.convertCurrencyDetails.message);
                                return Container();

                              case Status.COMPLETED:
                                final convertedCurrency = value
                                    .convertCurrencyDetails
                                    .data!
                                    .result!
                                    .convertedAmount!;

                                convertedCurrencyController.value =
                                    convertedCurrencyController.value.copyWith(
                                        text: convertedCurrency.toString());

                                return MyTextField(
                                    header: "Converted Amount",
                                    controller: convertedCurrencyController,
                                    hint: "Converted Amount");

                              default:
                                return const MyLoadingIndicator();
                            }
                          }),
                        const SizedBox(height: 40),
                        MyElevatedButton(
                            title: "Convert",
                            onTap: () {
                              value
                                  .getConvertCurrencyDetails(
                                      fromCurrencyController.text,
                                      toCurrencyController.text,
                                      amountController.text.trim())
                                  .then((value) {
                                setState(() {
                                  isConverted = true;
                                });
                              });
                            })
                      ]));

                default:
                  return const MyLoadingIndicator();
              }
            })));
  }
}
