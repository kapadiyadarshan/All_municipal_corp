import 'package:flutter/material.dart';

import '../../utils/guj_municipallist.dart';
import '../../utils/routes_utils.dart';

class DemoPage2 extends StatelessWidget {
  const DemoPage2({super.key});

  @override
  Widget build(BuildContext context) {
    // Map data = ModalRoute.of(context)!.settings.arguments as Map;

    List cities = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Municipal Corporation"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Wrap(
                children: List.generate(
                  cities.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        MyRoute.webViewPage,
                        arguments: cities[index],
                      );
                    },
                    child: Card(
                      child: Container(
                        height: 230,
                        width: 191,
                        decoration: BoxDecoration(
                          // color: Colors.green.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage(cities[index]["logo"]),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${cities[index]["city"]}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
