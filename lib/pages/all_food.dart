import 'package:flutter/material.dart';

class AllFoodPage extends StatelessWidget {
  const AllFoodPage({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ALl Food Page")),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Text(
                type == "Fruit" ? "ผลไม้" : "ข้าวแป้ง",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuTypeIcon extends StatelessWidget {
  const MenuTypeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, height: 30, width: 30);
  }
}
