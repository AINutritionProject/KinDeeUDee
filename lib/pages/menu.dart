import 'package:appfood2/pages/all_food.dart';
import 'package:appfood2/pages/camera.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:appfood2/pages/information/information.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: const Color.fromARGB(255, 255, 120, 63),
          hoverColor: const Color.fromRGBO(255, 120, 63, 0.5),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const CameraPage(replaceWhenNavigate: false)));
          },
          child: const Icon(
            size: 65.0,
            Icons.camera_alt,
          ),
        ),
        appBar: AppBar(
          title: const Text("Find Menu"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RealAllFoodPage(
                            type: "Fruit",
                          )));
                },
                icon: const Icon(Icons.tv)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const RealAllFoodPage(type: "Flour")));
                },
                icon: const Icon(Icons.tv)),
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
        backgroundColor: const Color.fromRGBO(234, 255, 241, 1),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(234, 255, 241, 1),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 30, top: 10, bottom: 24),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 212,
                            height: 41,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(91, 158, 130, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                )),
                            child: const Text(
                              "กลับสู่เมนูหลัก",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ],
                ),
                const TextFieldExample(),
              ],
            ),
          ),
        ));
  }
}

class MenuTypeIcon extends StatelessWidget {
  const MenuTypeIcon(
      {super.key,
      required this.name,
      required this.color,
      required this.imageAssetPath,
      required this.colorIcon});
  final String name;
  final Color color;
  final String imageAssetPath;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: colorIcon,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    )),
              ),
              Center(child: Image.asset(imageAssetPath)),
            ],
          )),
    );
  }
}

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  bool _active = false;
  late List<Food> allFoodData;
  late List<Food> foodQuery;

  @override
  void initState() {
    super.initState();
    getFoodByTypeFromCSV().then((value) {
      allFoodData = value;
      foodQuery = getFoodQuery('');
    });
  }

  Future<List<Food>> getFoodByTypeFromCSV() async {
    final rawData = await rootBundle.loadString("assets/allfood.csv");
    List<List<dynamic>> dataAsList =
        const CsvToListConverter().convert(rawData);
    List<Food> foodList = [];
    for (var element in dataAsList) {
      foodList.add(Food(
        name: element[1],
        type: element[11],
        detail: FoodNutritionDetail(
            name: element[3],
            giIndex: element[5],
            benefit: element[9],
            power: element[6],
            sugar: element[8],
            fiber: element[7],
            nutrition: element[10],
            protein: element[12],
            fat: element[13],
            carbo: element[14],
            // ignore: prefer_interpolation_to_compose_strings
            realImageAssetPath: "assets/images/RealFruit/" + element[4]),
        // ignore: prefer_interpolation_to_compose_strings
        imageAssetPath: "assets/images/Fruit/" + element[2],
      ));
    }
    return foodList;
  }

  List<Food> getFoodQuery(String query) {
    List<Food> foodList = [];
    allFoodData.forEach((f) {
      if (f.name.toLowerCase().contains(query.toLowerCase())) {
        foodList.add(f);
      }
    });

    return foodList;
  }

  String text_seach = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 31, right: 32),
          child: Container(
            width: double.infinity,
            height: 53,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                )),
            child: Row(children: [
              Expanded(
                  flex: 5,
                  child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      width: double.infinity,
                      child: TextField(
                          decoration: InputDecoration(
                            hintText: "พิมพ์ชื่ออาหารตรงนี้สิ",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          onChanged: (text) {
                            setState(
                              () {
                                if (text == "") {
                                  _active = false;
                                } else {
                                  _active = true;
                                }
                                text_seach = text;
                                print('First text field: $text');
                                print(' $_active............');
                                foodQuery = getFoodQuery(text);
                              },
                            );
                          },
                          style: const TextStyle(fontSize: 20)))),
              const Expanded(flex: 1, child: Icon(Icons.search)),
            ]),
          ),
        ),
        (_active)
            ? Container(
                height: 640,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: foodQuery
                      .map((food) => Expanded(
                            child: FoodIcons(food: food),
                          ))
                      .toList(),
                ))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 160,
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RealAllFoodPage(type: "Fruit"),
                              ),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const RealAllFoodPage(type: "Fruit")));
                            },
                            child: MenuTypeIcon(
                              name: "ผลไม้",
                              color: Colors.green.shade100,
                              colorIcon: const Color.fromRGBO(167, 222, 189, 1),
                              imageAssetPath: "assets/images/Menu/fruit.png",
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const RealAllFoodPage(type: "Flour")));
                          },
                          child: const MenuTypeIcon(
                            name: "ข้าว-แป้ง",
                            color: Color.fromRGBO(248, 255, 214, 1),
                            colorIcon: Color.fromRGBO(243, 222, 179, 1),
                            imageAssetPath: "assets/images/Menu/rice.png",
                          ),
                        )),
                  ]),
                ),
              ),
      ],
    );
  }
}
