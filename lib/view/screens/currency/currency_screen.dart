import 'package:flutter/material.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/text_field/my_text_field.dart';

class CurrencyScreen extends StatelessWidget {
  CurrencyScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController currentCurrencyController =
      TextEditingController();
  final TextEditingController newCurrencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Currency"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              MyTextField(
                  header: "Amount",
                  controller: amountController,
                  hint: "Amount"),
              MyTextField(
                  header: "From",
                  isReadable: true,
                  dropDownList: const ["PKR", "AED", "USD", "EUR"],
                  controller: currentCurrencyController,
                  hint: "PKR"),
              MyTextField(
                  header: "To",
                  isReadable: true,
                  dropDownList: const ["PKR", "AED", "USD", "EUR"],
                  controller: newCurrencyController,
                  hint: "USD"),
              MyTextField(
                  header: "Amount",
                  isReadable: true,
                  controller: amountController,
                  hint: "Converted Amount"),
              const SizedBox(height: 40),
              MyElevatedButton(title: "Convert", onTap: () {})
            ])));
  }
}
