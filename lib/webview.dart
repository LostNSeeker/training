import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Webview extends StatelessWidget {
  const Webview({super.key});


  @override
  Widget build(BuildContext context) {
    // https://www.koenig-solutions.com/
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(
            controller: WebViewController()
              ..loadRequest(Uri.parse('https://www.google.com'))),
      ),
    );
  }}