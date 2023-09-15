import 'package:all_municipal_corp/controller/webPage_controller.dart';
import 'package:all_municipal_corp/utils/routes_utils.dart';
import 'package:all_municipal_corp/views/screens/demoPage.dart';
import 'package:all_municipal_corp/views/screens/demoPage2.dart';
import 'package:all_municipal_corp/views/screens/webViewPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WebPageController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.demoPage,
      routes: {
        MyRoute.webViewPage: (context) => WebViewPage(),
        MyRoute.demoPage: (context) => DemoPage(),
        MyRoute.demoPage2: (context) => DemoPage2(),
      },
    );
  }
}
