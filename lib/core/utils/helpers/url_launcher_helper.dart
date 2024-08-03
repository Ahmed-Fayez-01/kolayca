import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static void launch(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchWhatsapp(String phone) async {
    String androidUrl = "whatsapp://send?phone=$phone";
    String iosUrl = "https://wa.me/$phone";
    if (Platform.isAndroid && await canLaunchUrl(Uri.parse(androidUrl))) {
      await launchUrl(Uri.parse(androidUrl));
    } else if (Platform.isIOS && await canLaunchUrl(Uri.parse(iosUrl))) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      throw 'Could not launch $androidUrl';
    }
  }
}
