import 'package:flutter/material.dart';
import 'package:appfood2/pages/ai_output.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/widgets/button_back.dart';
import 'package:appfood2/screen_size.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.detail});
  final FoodNutritionDetail detail;
  Color getGIColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(233, 255, 223, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(250, 248, 232, 1);
    } else {
      return const Color.fromRGBO(255, 228, 228, 1);
    }
  }

  Color getBarColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(162, 223, 133, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(249, 241, 176, 1);
    } else {
      return const Color.fromRGBO(255, 141, 141, 1);
    }
  }

  Color getBarsmilColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(3, 219, 24, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(252, 255, 108, 1);
    } else {
      return const Color.fromRGBO(255, 0, 0, 1);
    }
  }

  Color getColorIconBack(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(206, 255, 183, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(255, 246, 165, 1);
    } else {
      return const Color.fromRGBO(255, 228, 228, 1);
    }
  }

  String getGlycemicIndex(num giIndex) {
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
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      //backgroundColor: _getGIColor(detail.giIndex),
      body: SafeArea(
        child: Container(
          height: screenSizeData.screenHeight,
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: screenSizeData.screenSizeWidth,
                decoration: BoxDecoration(
                  color: getGIColor(detail.giIndex),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenSizeData.screenSizeWidth,
                      height: 130,
                      decoration:
                          BoxDecoration(color: getBarColor(detail.giIndex)),
                      child: Stack(
                        clipBehavior: Clip.none,
                        //alignment: Alignment.center,
                        //alignment: Alignment.bottomCenter,
                        children: [
                          // Container(
                          //   width: double.infinity,
                          //   height: ((detail.name).length > 16) ? 193 : 158,
                          //   color: _getGIColor(detail.giIndex),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       bottom: ((detail.name).length > 16) ? 73 : 38),
                          //   child: Container(
                          //     width: double.infinity,
                          //     height: 120,
                          //     color: _getBarColor(detail.giIndex),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: ButtonBack(
                                colorCircle:
                                    const Color.fromRGBO(86, 61, 51, 1),
                                color: getColorIconBack(detail.giIndex),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SmileFace(
                                  smileColor: getBarsmilColor(detail.giIndex)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 30),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  getGlycemicIndex(detail.giIndex),
                                  style: TextStyle(
                                      fontSize:
                                          screenSizeData.screenSizeWidth < 600
                                              ? 13
                                              : 16,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: screenSizeData.screenSizeWidth * 0.5 - 134,
                            child: Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 268,
                              height: ((detail.name).length > 16) ? 111 : 76,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: Colors.white,
                              ),
                              child: Text(
                                detail.name,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, ((detail.name).length > 16) ? 100 : 80, 0, 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48 * 3),
                          child: Image.asset(
                            detail.realImageAssetPath ??
                                "assets/cameraFrame.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const TextDataNutrition(),
                    AmountDetailObject(
                      textAmountOfObj: '${detail.name}\n 1 ส่วน 120 กรัม',
                      colorBox: const Color.fromRGBO(255, 255, 255, 1),
                      width: screenSizeData.screenSizeWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: ChemicalDetail(
                          power: detail.power,
                          fiber: detail.fiber,
                          sugar: detail.sugar),
                    ),
                    BenefitDetailContainer(
                      textBenefitDetail: detail.benefit,
                      width: screenSizeData.screenWidth,
                    ),
                    ClickHereContainer(
                      foodDetail: detail,
                      width: screenSizeData.screenSizeWidth,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonBackBoom extends StatelessWidget {
  const ButtonBackBoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(86, 61, 51, 1),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Center(
          child: Text(
            "<",
            style: TextStyle(
                fontSize: 35, color: Color.fromRGBO(255, 187, 220, 1)),
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Container(
            //padding: const EdgeInsets.all(30),

            width: 115,
            height: 115,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("พลังงาน",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                  "$power",
                  style: const TextStyle(
                      color: Color.fromRGBO(9, 183, 173, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      height: 1.2),
                ),
                const Text("กิโลแคลอรี่",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Container(
            //padding: const EdgeInsets.all(30),
            width: 115,
            height: 115,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ใยอาหาร",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                  "$fiber",
                  style: const TextStyle(
                      color: Color.fromRGBO(9, 183, 173, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      height: 1.2),
                ),
                const Text("กรัม",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Container(
            //padding: const EdgeInsets.all(30),
            width: 115,
            height: 115,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "น้ำตาล",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$sugar",
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 141, 35, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      height: 1.2),
                ),
                const Text("กรัม",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
  const SmileFace({super.key, required this.smileColor});
  final Color smileColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: smileColor,
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
