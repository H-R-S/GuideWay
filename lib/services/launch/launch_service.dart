import '../../resources/url/app_url.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchLink {
  
  static void launchMessengerChat() async {
    try {
      launchUrl(Uri.parse(AppURL.messengerEndPoint),
          mode: LaunchMode.externalApplication);
    } catch (e) {
      rethrow;
    }
  }

  static void launchFacebookPage() async {
    try {
      launchUrl(Uri.parse(AppURL.facebookEndPoint),
          mode: LaunchMode.externalApplication);
    } catch (e) {
      rethrow;
    }
  }
}