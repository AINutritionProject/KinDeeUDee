import 'package:appfood2/db.dart';
import 'package:appfood2/pages/all_food.dart';
import 'package:appfood2/pages/camera.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appfood2/screen_size.dart';

class MenuPage extends StatelessWidget {
  final User user;
  const MenuPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: const Color.fromRGBO(234, 255, 241, 1),
        body: SafeArea(
          child: Container(
            color: screenSizeData.screenWidth <= screenSizeData.maxWidth
                ? Colors.white
                : Colors.black,
            child: Center(
              child: Container(
                width: screenSizeData.screenSizeWidth,
                height: screenSizeData.screenHeight,
                color: const Color.fromRGBO(234, 255, 241, 1),
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: BoxButtonToMenu(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(flex: 75, child: TextFieldExample()),
                    Expanded(
                        flex: 15,
                        child: SizedBox(
                          width: screenSizeData.screenSizeWidth,
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CameraPage(
                                          user: user,
                                        )))
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 120, 63, 1),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  size: 65.0,
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class BoxButtonToMenu extends StatelessWidget {
  const BoxButtonToMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(91, 158, 130, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          )),
      child: const Text(
        "กลับสู่เมนูหลัก",
        style: TextStyle(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
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
            name: element[3].replaceAll("_", ","),
            giIndex: element[5],
            benefit: element[9],
            power: element[6],
            sugar: element[8],
            fiber: element[7],
            nutrition: element[10],
            protein: element[12],
            fat: element[13],
            carbo: element[14],
            realImageAssetPath:
                // ignore: prefer_interpolation_to_compose_strings
                "assets/images/Real${element[11]}/" + element[4]),
        imageAssetPath:
            // ignore: prefer_interpolation_to_compose_strings
            "assets/images/${element[11] == 'Fruit' ? 'Fruit' : 'RiceFlour'}/" +
                element[2],
      ));
    }
    return foodList;
  }

  List<Food> getFoodQuery(String query) {
    List<Food> foodList = [];
    for (var f in allFoodData) {
      if (f.name.toLowerCase().contains(query.toLowerCase())) {
        foodList.add(f);
      }
    }

    return foodList;
  }

  // ignore: non_constant_identifier_names
  String text_seach = "";
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
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
            ? Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    children: [
                      for (var item in foodQuery)
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: FoodIcons(
                              food: item,
                              width: screenSizeData.screenSizeWidth,
                            )),
                    ],
                  ),
                ),
              )
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
