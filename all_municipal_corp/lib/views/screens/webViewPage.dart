import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text("${data["city"]}"),
        centerTitle: true,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(data["url"]),
        ),
      ),
    );
  }
}
