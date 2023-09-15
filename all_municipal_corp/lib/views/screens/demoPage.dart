import 'package:flutter/material.dart';

import '../../utils/guj_municipallist.dart';
import '../../utils/routes_utils.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  AllStates.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        MyRoute.demoPage2,
                        arguments: AllStates[index]["allcities"],
                      );
                    },
                    child: Card(
                      child: Container(
                        height: 190,
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
                              foregroundImage:
                                  AssetImage(AllStates[index]["logo"]),
                              child: Text(
                                "${AllStates[index]["state"][0]}",
                                style: const TextStyle(fontSize: 64),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${AllStates[index]["state"]}",
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
