import 'package:appfood2/pages/food_detailed.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/widgets/button_back.dart';

class FoodAdvanceDetailPage extends StatelessWidget {
  const FoodAdvanceDetailPage(
      {super.key, required this.name, required this.foodDetail});
  final FoodNutritionDetail foodDetail;
  final String name;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 225, 1),
      body: SafeArea(
        child: Container(
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: Container(
              color: const Color.fromRGBO(255, 248, 225, 1),
              height: screenSizeData.screenHeight,
              width: screenSizeData.screenSizeWidth,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: ButtonBack(
                                color: Colors.white,
                                colorCircle: Colors.amber[700],
                              )),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 15, 50, 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              constraints: const BoxConstraints(
                                  minWidth: 100, minHeight: 50),
                              child: Text(
                                foodDetail.name,
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 55),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(191, 255, 161, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          'น้ำหนัก 100 กรัม',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    BoxNutritionDetail(
                      width: screenSizeData.screenSizeWidth,
                      height: screenSizeData.screenHeight,
                      textDetailLeft:
                          "พลังงาน\n${foodDetail.power}\nกิโลแคลอรี่",
                      textDetailRight: 'โปรตีน\n${foodDetail.protein}\nกรัม',
                    ),
                    BoxNutritionDetail(
                        width: screenSizeData.screenSizeWidth,
                        height: screenSizeData.screenHeight,
                        textDetailLeft: 'ไขมัน\n${foodDetail.fat}\nกรัม',
                        textDetailRight:
                            'คาร์โบไฮเดรต\n${foodDetail.carbo}\nกรัม'),
                    BoxNutritionDetail(
                        width: screenSizeData.screenSizeWidth,
                        height: screenSizeData.screenHeight,
                        textDetailLeft: 'ใยอาหาร\n${foodDetail.fiber}\nกรัม',
                        textDetailRight: 'น้ำตาล\n${foodDetail.sugar}\nกรัม'),
                    SizedBox(
                      width: screenSizeData.screenSizeWidth,
                      height: 100,
                    )
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

class BoxNutritionDetail extends StatelessWidget {
  const BoxNutritionDetail(
      {super.key,
      required this.textDetailLeft,
      required this.textDetailRight,
      required this.height,
      required this.width});

  final String textDetailLeft;
  final String textDetailRight;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
          child: Center(
            child: Container(
              //padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: width * 0.4,
              height: width * 0.35,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textDetailLeft,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
          child: Container(
            //padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            width: width * 0.4,
            height: width * 0.35,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      textDetailRight,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
