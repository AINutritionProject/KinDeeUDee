import 'package:flutter/material.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    List<Food> foodList = [];
    for (var element in dataAsList) {
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
            // ignore: prefer_interpolation_to_compose_strings
            realImageAssetPath: "assets/images/RealFruit/" + element[4]),
        // ignore: prefer_interpolation_to_compose_strings
        imageAssetPath: "assets/images/Fruit/" + element[2],
      ));
    }
    List<List<Food>> dataIndex = [];
    for (int i = 0; i < foodList.length / 2 - 1; i++) {
      dataIndex.add([foodList[i * 2], foodList[i * 2 + 1]]);
    }
    if (foodList.length % 2 != 0) {
      dataIndex.add([foodList[foodList.length - 1]]);
    }
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
      backgroundColor: const Color.fromRGBO(255, 241, 224, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 40),
                child: Container(
                  alignment: Alignment.center,
                  width: 224,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    type == "Fruit" ? "ผลไม้" : "ข้าวแป้ง",
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "GI = ค่าดัชนีน้ำตาล",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(97, 97, 97, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SmileFace(
                            SmileColor: Color.fromRGBO(3, 219, 24, 0.65),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SmileFace(
                            SmileColor: Color.fromRGBO(252, 255, 108, 1),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SmileFace(
                            SmileColor: Color.fromRGBO(252, 0, 0, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 75),
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 53,
                          width: 64,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text("ต่ำ"),
                              ),
                              Text("GI<55")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 53,
                            width: 73,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text("กลาง"),
                                ),
                                Text("GI 55-69")
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 53,
                          width: 64,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text("สูง"),
                              ),
                              Text("GI>70")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            ...foodData.map((e) {
              if (e.length == 2) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 34, right: 15),
                            child: FoodIcons(food: e[0]),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 34),
                            child: FoodIcons(food: e[1]),
                          )),
                    ]);
              } else {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 34, right: 15),
                            child: FoodIcons(food: e[0]),
                          )),
                      const Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 34),
                          )),
                    ]);
              }
            })
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FoodDetailPage(detail: food.detail)));
        },
        child: Column(
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
                    margin: const EdgeInsets.only(top: 12, bottom: 12),
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
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
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

class SmileFace extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const SmileFace({super.key, required this.SmileColor});
  // ignore: non_constant_identifier_names
  final Color SmileColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: SmileColor,
            shape: BoxShape.circle,
          ),
          child: const FaIcon(
            FontAwesomeIcons.faceSmile,
            color: Colors.black,
            size: 60,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 6),
            shape: BoxShape.circle,
          ),
          width: 60,
          height: 60,
        )
      ],
    );
  }
}
