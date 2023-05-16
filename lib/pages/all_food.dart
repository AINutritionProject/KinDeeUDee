import 'package:flutter/material.dart';
import 'package:appfood2/pages/food_detailed.dart';

class AllFoodPage extends StatelessWidget {
  const AllFoodPage({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ALl Food Page")),
      backgroundColor: Colors.yellow.shade100,
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
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: foodData
                  .map(
                    (food) => Container(
                        margin: const EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodDetailPage(
                                    detail: food.detail,
                                  ),
                                ),
                              );
                            },
                            child: FoodIcons(food: food))),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

const foodData = [
  Food(
    name: "กล้วยไข่",
    type: "Fruit",
    detail: FoodNutritionDetail(
        name: "กล้วยไข่,สุก",
        giIndex: 30,
        realImageAssetPath: "assets/images/RealFruit/Y1.jpg",
        benefit:
            "Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.",
        power: 57,
        fiber: 4.5,
        sugar: 8),
    imageAssetPath: "assets/images/Fruit/fruit2.png",
  ),
  Food(
      name: "กล้วยน้ำว้า",
      type: "Fruit",
      detail: FoodNutritionDetail(
          name: "กล้วยไข่,สุก",
          giIndex: 300,
          benefit:
              "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
          power: 57,
          fiber: 1.9,
          sugar: 9),
      imageAssetPath: "assets/images/Fruit/fruit3.png"),
  Food(
      name: "กล้วยหอม",
      type: "Fruit",
      detail: FoodNutritionDetail(
          name: "กล้วยไข่,สุก",
          giIndex: 300,
          benefit:
              "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
          power: 79,
          fiber: 1.6,
          sugar: 12),
      imageAssetPath: "assets/images/Fruit/fruit4.png"),
  Food(
      name: "ขนุนสุก",
      type: "Fruit",
      detail: FoodNutritionDetail(
          name: "กล้วยไข่,สุก",
          giIndex: 300,
          benefit:
              "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
          power: 200,
          sugar: 200,
          fiber: 22.92),
      imageAssetPath: "assets/images/Fruit/fruit5.png"),
  Food(
      name: "แก้วมังกรขาว",
      type: "Fruit",
      detail: FoodNutritionDetail(
          name: "กล้วยไข่,สุก",
          giIndex: 300,
          benefit:
              "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
          power: 9000,
          sugar: 2,
          fiber: 224.02),
      imageAssetPath: "assets/images/Fruit/fruit6.png"),
];

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
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
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
    required this.detail,
  });
  final String name;
  final String type;
  final String imageAssetPath;
  final FoodNutritionDetail detail;
}
