import 'package:flutter/material.dart';
import 'package:webview_application/data/app_platform.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView({required String link}) => AppPlatform.isMobile
    ? WebView(
        initialUrl: link,
      )
    : Hyperlink(link: link);

class Hyperlink extends StatelessWidget {
  final String link;

  const Hyperlink({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        link,
        style: const TextStyle(
            decoration: TextDecoration.underline, color: Colors.blue),
      ),
    );
  }
}
