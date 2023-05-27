import 'package:flutter/material.dart';
import '../../../resources/constants/documents.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TermsAndConditionScreen extends StatelessWidget {
  TermsAndConditionScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Terms & Condition"),
        body: SfPdfViewer.asset(termsAndCondition));
  }
}