import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/information.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Find Menu"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InformationPage()));
              },
              child: const Text("information"),
            )
          ],
        ),
        body: const Center(
          child: Text("MenuPage"),
        ));
  }
}
