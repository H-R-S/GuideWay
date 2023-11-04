import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/app_bar/my_app_bar.dart';

class WebViewScreen extends StatelessWidget {
  final String? url, title;

  WebViewScreen({super.key, this.url, required this.title});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        scaffoldKey,
        context,
        isBack: true,
        title: title,
      ),
      // body:
      // WebViewWidget.fromPlatform(platform: platform)
      // WebView(
      //     backgroundColor: Colors.white,
      //     initialUrl:
      //         url ?? "www.google.com",
      //     javascriptMode: JavascriptMode.unrestricted,
      //     onProgress: (progress) {
      //       // print("progress: $progress");
      //     },
      //     onWebViewCreated: (WebViewController controller) {
      //       // _controller.complete(controller);
      //       // _injectJavaScript(controller);
      //     }),
    );
  }
}
