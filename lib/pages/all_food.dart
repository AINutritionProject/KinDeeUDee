import 'package:flutter/material.dart';

class AllFoodPage extends StatelessWidget {
  const AllFoodPage({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ALl Food Page")),
      body: const Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 30,
          )
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
