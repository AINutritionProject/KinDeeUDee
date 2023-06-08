import 'package:flutter/material.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/widgets/button_back.dart';

class RealAllFoodPage extends StatefulWidget {
  const RealAllFoodPage({super.key, required this.type});
  final String type;

  @override
  State<RealAllFoodPage> createState() => _RealAllFoodPageState();
}

class _RealAllFoodPageState extends State<RealAllFoodPage> {
  Future<List<List<Food>>> getFoodByTypeFromCSV(String type) async {
    final rawData = await rootBundle.loadString("assets/allfood.csv");
    List<List<dynamic>> dataAsList =
        const CsvToListConverter().convert(rawData);
    List<Food> foodList = [];
    for (var element in dataAsList) {
      if (element[11] != type) {
        continue;
      }
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
            protein: element[12],
            fat: element[13],
            carbo: element[14],
            nutrition: element[10],
            // ignore: prefer_interpolation_to_compose_strings
            realImageAssetPath: "assets/images/Real$type/" + element[4]),
        // ignore: prefer_interpolation_to_compose_strings
        imageAssetPath:
            "assets/images/${type == 'Fruit' ? 'Fruit' : 'RiceFlour'}/" +
                element[2],
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                            color: type == "Fruit"
                                ? const Color.fromRGBO(198, 242, 178, 0.65)
                                : const Color.fromRGBO(255, 115, 55, 0.65)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 55),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: BoxTitleNameType(type: type)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ButtonBack(
                          color: Colors.white,
                          colorCircle: type == "Fruit"
                              ? const Color.fromRGBO(18, 109, 104, 1)
                              : const Color.fromRGBO(163, 70, 30, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "GI = ค่าดัชนีน้ำตาล",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: BoxContainSmileIcon(),
              ),
              ...foodData.map((e) {
                if (e.length == 2) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: FoodIcons(food: e[0]))),
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: FoodIcons(food: e[1]))),
                      ]);
                } else {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: FoodIcons(food: e[0]))),
                        const Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox()
                            )
                        )
                      ]);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 70, w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BoxContainSmileIcon extends StatelessWidget {
  const BoxContainSmileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text("ต่ำ", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Text("GI<55", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text("กลาง", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    ),
                    Text("GI 55-69", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text("สูง", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Text("GI>70", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class BoxTitleNameType extends StatelessWidget {
  const BoxTitleNameType({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224,
      height: 80,
      decoration: BoxDecoration(
        color: type == "Fruit"
            ? const Color.fromRGBO(255, 163, 163, 1)
            : const Color.fromRGBO(255, 224, 163, 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Center(
        child: Text(
          type == "Fruit" ? "ผลไม้" : "ข้าวแป้ง",
          style: const TextStyle(
            fontSize: 50,
          ),
          textAlign: TextAlign.center,
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
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FoodDetailPage(detail: food.detail)));
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.42,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      //margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        food.imageAssetPath,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
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
