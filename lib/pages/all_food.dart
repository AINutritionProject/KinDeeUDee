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
          const Center(
            child: FoodIcons(
                food: Food(
                    name: "กล้วยไข่",
                    type: "Fruit",
                    imageAssetPath: "assets/images/Fruit/fruit2.png")),
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

class FoodIcons extends StatelessWidget {
  const FoodIcons({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(40)),
            child: const SizedBox(
              width: 160,
              height: 160,
            ),
          ),
        ),
        Positioned(
          height: 320,
          width: 420,
          left: -97,
          top: -95,
          child: Image.asset(food.imageAssetPath),
        ),
        Positioned(
          bottom: -0,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Text(
              food.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class Food {
  const Food({
    required this.name,
    required this.type,
    required this.imageAssetPath,
  });
  final String name;
  final String type;
  final String imageAssetPath;
}
