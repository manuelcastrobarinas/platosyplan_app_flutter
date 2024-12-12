import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

showTermnsAndConditions() async {
  Uri uri = Uri.parse('https://nebula-syrup-a0b.notion.site/T-rminos-y-condiciones-14deb7efedee8084be20ffbc1bea0074');
  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) { 
    if (kDebugMode) {
      print("error abriendo los terminos y condiciones $e");
    }
  }
}