import 'package:flutter/material.dart';
import 'package:appfood2/pages/ai_output.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.detail});
  final FoodNutritionDetail detail;
  Color _getGIColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(233, 255, 223, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(250, 248, 232, 1);
    } else {
      return const Color.fromRGBO(255, 228, 228, 1);
    }
  }

  Color _getBarColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(162, 223, 133, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(249, 241, 176, 1);
    } else {
      return const Color.fromRGBO(255, 141, 141, 1);
    }
  }

  Color _getBarsmilColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(3, 219, 24, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(252, 255, 108, 1);
    } else {
      return const Color.fromRGBO(255, 0, 0, 1);
    }
  }

  String _get_glycemic_index(num giIndex) {
    if (giIndex < 55) {
      return "ดัชนีน้ำตาล<55";
    } else if (giIndex < 70 && giIndex >= 55) {
      return "ค่าดัชนีน้ำตาล 56 ถึง 69";
    } else {
      return "ค่าดัชนีน้ำตาล >70";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getGIColor(detail.giIndex),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 43),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 158,
                        color: _getGIColor(detail.giIndex),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 38),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          color: _getBarColor(detail.giIndex),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 85, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          const Color.fromRGBO(86, 61, 51, 1),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Center(
                                        child: Text(
                                          "<",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Color.fromRGBO(
                                                  255, 187, 220, 1)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmileFace(
                                      SmileColor:
                                          _getBarsmilColor(detail.giIndex)),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      _get_glycemic_index(detail.giIndex),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 54, right: 54),
                        child: Container(
                          alignment: Alignment.center,
                          height: 76,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Colors.white,
                          ),
                          child: Text(
                            detail.name,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48 * 3),
                      child: Image.asset(
                        detail.realImageAssetPath ?? "assets/cameraFrame.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const TextDataNutrition(),
                AmountDetailObject(
                  textAmountOfObj: '${detail.name}\n 1 ส่วน 120 กรัม',
                  colorBox: const Color.fromRGBO(255, 255, 255, 1),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: ChemicalDetail(
                      power: detail.power,
                      fiber: detail.fiber,
                      sugar: detail.sugar),
                ),
                BenefitDetailContainer(textBenefitDetail: detail.benefit),
                const ClickHereContainer(),
              ],
            ),
          ),
        ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Container(
            //padding: const EdgeInsets.all(30),

            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("พลังงาน",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  "$power",
                  style: const TextStyle(
                      color: Color.fromRGBO(9, 183, 173, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                const Text("กิโลแคลอรี่",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Container(
            //padding: const EdgeInsets.all(30),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ใยอาหาร",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  "$fiber",
                  style: const TextStyle(
                      color: Color.fromRGBO(9, 183, 173, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                const Text("กรัม",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Container(
            //padding: const EdgeInsets.all(30),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "น้ำตาล",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$sugar",
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 141, 35, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                const Text("กรัม",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
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
      required this.sugar,
      required this.protein,
      required this.fat,
      required this.carbo,
      required this.nutrition});
  final String name;
  final String? realImageAssetPath;
  final num giIndex;
  final String benefit;
  final num power;
  final num fiber;
  final num sugar;
  final num protein;
  final num fat;
  final num carbo;
  final String nutrition;
}

class SmileFace extends StatelessWidget {
  const SmileFace({super.key, required this.SmileColor});
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
