import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.detail});
  final FoodNutritionDetail detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodDetailPage"),
      ),
      body: Column(children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Text(
              detail.name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
        Image.asset(detail.realImageAssetPath ?? "assets/cameraFrame.png")
      ]),
    );
  }
}

class FoodNutritionDetail {
  const FoodNutritionDetail(
      {required this.name, required this.giIndex, this.realImageAssetPath});
  final String name;
  final String? realImageAssetPath;
  final double giIndex;
}
