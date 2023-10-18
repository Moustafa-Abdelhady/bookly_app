import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    launchSnackBar(context,"Can't Launch $url");
  }
}
}

void launchSnackBar(context, String text) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
