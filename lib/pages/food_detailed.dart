import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.detail});
  final FoodNutritionDetail detail;
  Color _getGIColor(num giIndex) {
    if (giIndex < 55) {
      return Colors.green.shade100;
    } else if (giIndex < 70 && giIndex >= 55) {
      return Colors.yellow.shade100;
    } else {
      return Colors.red.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodDetailPage"),
      ),
      backgroundColor: _getGIColor(detail.giIndex),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Text(
                detail.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48 * 3),
              child: Image.asset(
                detail.realImageAssetPath ?? "assets/cameraFrame.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "ข้อมูลโภชนาการ",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(76, 36, 29, 1)),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ChemicalDetail(
                  power: detail.power,
                  fiber: detail.fiber,
                  sugar: detail.sugar)),
          Padding(
              padding: const EdgeInsets.only(left: 13, right: 13, top: 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 194, 227, 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "ประโยชน์",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(detail.benefit,
                            style: const TextStyle(
                                fontSize: 18,
                                height: 1.75,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: 13, right: 13, top: 15, bottom: 18),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "กดที่นี่",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("เพื่อดูข้อมูลทางโภชนาการเพิ่มเติม",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600))
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}

class ChemicalDetail extends StatelessWidget {
  const ChemicalDetail({
    super.key,
    required this.power,
    required this.fiber,
    required this.sugar,
  });
  final num power;
  final num fiber;
  final num sugar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 126,
                  height: 126,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "พลังงาน",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "$power",
                          style: const TextStyle(
                              color: Color.fromRGBO(9, 183, 173, 1),
                              fontWeight: FontWeight.w900,
                              fontSize: 26),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "กิโลแคลอรี่",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 126,
                  height: 126,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "ใยอาหาร",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2, top: 2),
                        child: Text(
                          "$fiber",
                          style: const TextStyle(
                              color: Color.fromRGBO(9, 183, 173, 1),
                              fontWeight: FontWeight.w900,
                              fontSize: 26),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "กรัม",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 126,
                  height: 126,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "น้ำตาล",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2, top: 2),
                        child: Text(
                          "$sugar",
                          style: const TextStyle(
                              color: Color.fromRGBO(255, 141, 35, 1),
                              fontWeight: FontWeight.w900,
                              fontSize: 26),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "กรัม",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class FoodNutritionDetail {
  const FoodNutritionDetail(
      {required this.name,
      required this.giIndex,
      this.realImageAssetPath,
      required this.benefit,
      required this.power,
      required this.fiber,
      required this.sugar});
  final String name;
  final String? realImageAssetPath;
  final num giIndex;
  final String benefit;
  final num power;
  final num fiber;
  final num sugar;
}
