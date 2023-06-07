import 'package:appfood2/pages/food_detailed.dart';
import 'package:flutter/material.dart';

class FoodAdvanceDetailPage extends StatelessWidget {
  const FoodAdvanceDetailPage(
      {super.key, required this.name, required this.foodDetail});
  final FoodNutritionDetail foodDetail;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 225, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 45, 0, 20),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  constraints:
                      const BoxConstraints(minWidth: 100, minHeight: 50),
                  child: Text(
                    foodDetail.name,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 55),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(191, 255, 161, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    'น้ำหนัก 100 กรัม',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              BoxNutritionDetail(
                textDetailLeft: "พลังงาน\n${foodDetail.power}\nกิโลแคลอรี่",
                textDetailRight: 'โปรตีน\n${foodDetail.protein}\nกรัม',
              ),
              BoxNutritionDetail(
                  textDetailLeft: 'ไขมัน\n${foodDetail.fat}\nกรัม',
                  textDetailRight: 'คาร์โบไฮเดรต\n${foodDetail.carbo}\nกรัม'),
              BoxNutritionDetail(
                  textDetailLeft: 'ใยอาหาร\n${foodDetail.fiber}\nกรัม',
                  textDetailRight: 'น้ำตาล\n${foodDetail.sugar}\nกรัม'),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BoxNutritionDetail extends StatelessWidget {
  const BoxNutritionDetail(
      {super.key, required this.textDetailLeft, required this.textDetailRight});

  final String textDetailLeft;
  final String textDetailRight;

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
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.35,
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
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.35,
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
