import 'package:flutter/material.dart';

import '../../utils/guj_municipallist.dart';
import '../../utils/routes_utils.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("India State"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff8EC5FC),
                              Color(0xffE0C3FC),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              foregroundImage:
                                  AssetImage(AllStates[index]["logo"]),
                              child: Text(
                                "${AllStates[index]["state"][0]}",
                                style: const TextStyle(
                                  fontSize: 64,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(
                              "${AllStates[index]["state"]}",
                              style: const TextStyle(
                                fontSize: 20,
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
