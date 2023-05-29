import 'package:flutter/material.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class RealAllFoodPage extends StatefulWidget {
  const RealAllFoodPage({super.key, required this.type});
  final String type;

  @override
  State<RealAllFoodPage> createState() => _RealAllFoodPageState();
}

class _RealAllFoodPageState extends State<RealAllFoodPage> {
  Future<List<List<Food>>> getFoodByTypeFromCSV(String type) async {
    final rawData = await rootBundle.loadString(
        "assets/${widget.type == 'Fruit' ? 'fruit' : 'flour'}_detailed.csv");
    List<List<dynamic>> dataAsList =
        const CsvToListConverter().convert(rawData);
    print(dataAsList.length);
    List<Food> foodList = [];
    dataAsList.forEach((element) {
      foodList.add(Food(
        name: element[1],
        type: type,
        detail: FoodNutritionDetail(
            name: element[3],
            giIndex: element[5],
            benefit: element[9],
            power: element[6],
            sugar: element[8],
            fiber: element[7],
            realImageAssetPath: "assets/images/RealFruit/" + element[4]),
        imageAssetPath: "assets/images/Fruit/" + element[2],
      ));
    });
    List<List<Food>> dataIndex = [];
    print(foodList.length / 2);
    for (int i = 0; i < foodList.length / 2 - 1; i++) {
      dataIndex.add([foodList[i * 2], foodList[i * 2 + 1]]);
    }
    print(dataIndex);
    return dataIndex;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFoodByTypeFromCSV(widget.type),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AllFoodPage(type: widget.type, foodData: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class AllFoodPage extends StatelessWidget {
  const AllFoodPage({super.key, required this.type, required this.foodData});
  final String type;
  final List<List<Food>> foodData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ALl Food Page")),
      backgroundColor: Colors.yellow.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
            ...foodData.map((e) => Row(
                  children: [
                    Container(
                      child: FoodIcons(food: e[0]),
                    ),
                    Container(
                      child: FoodIcons(food: e[1]),
                    )
                  ],
                )),
          ],
        ),
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
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(children: [
            Align(
              child: Container(
                margin: EdgeInsets.only(top: 12, bottom: 12),
                width: 100,
                height: 100,
                child: Image.asset(
                  food.imageAssetPath,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ]),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 1),
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
      ],
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
