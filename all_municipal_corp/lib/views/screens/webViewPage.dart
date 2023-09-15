import 'package:all_municipal_corp/controller/webPage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Consumer<WebPageController>(builder: (context, provider, _) {
      return PopScope(
        canPop: provider.getCanPop,
        onPopInvoked: (didPop) {
          provider.checkCanPop();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("${data["city"]}"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(data["url"]),
                ),
                onLoadStart: (controller, url) {
                  provider.initController(controller: controller);
                },
                onLoadStop: (controller, url) {
                  provider.initController(controller: controller);
                },
                onProgressChanged: (controller, progress) {
                  provider.loading(pro: progress);
                },
              ),
              provider.progressValue < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: provider.progressValue,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}
