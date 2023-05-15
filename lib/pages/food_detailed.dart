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
        Text(detail.name),
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
