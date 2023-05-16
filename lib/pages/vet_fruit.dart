import 'package:flutter/material.dart';
import 'package:appfood2/pages/vet_ab.dart';

class VetFruitPage extends StatelessWidget {
  const VetFruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vet Fruit Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VetABPage(
                        type: "A",
                      )));
            },
            icon: const Icon(Icons.one_k),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VetABPage(
                        type: "B",
                      )));
            },
            icon: const Icon(Icons.two_k),
          )
        ],
      ),
    );
  }
}
