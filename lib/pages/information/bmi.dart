import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/nutrition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/db.dart' as db;

class BMIPage extends StatefulWidget {
  final db.User user;
  const BMIPage({
    super.key,
    required this.user,
  });

  @override
  State<BMIPage> createState() => _BMIState();
}

class _BMIState extends State<BMIPage> {
  late String username = widget.user.username;

  late double valBMI = calculateBMI(widget.user.weight, widget.user.height);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 
        (valBMI >= 30)
        ? const Color.fromRGBO(255, 175, 175, 1)
        : (valBMI >= 25 && valBMI <= 29.9)
        ? const Color.fromRGBO(255, 208, 193, 1)
        : (valBMI >= 23 && valBMI <= 24.9)
        ? const Color.fromRGBO(255, 245, 220, 1)
        : (valBMI >= 18.5 && valBMI <= 22.9)
        ? const Color.fromRGBO(217, 255, 200, 1)
        : const Color.fromRGBO(255, 245, 220, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: const Color.fromRGBO(177, 222, 255, 1),
                        ),
                        child: Image.asset(
                          'assets/images/BMI/weighing.png',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            const Text(
                              "“",
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              username,
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "”",
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
                child: Container(
                  height: 92,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(),
                                child: Text(
                                  "ค่าดัชนีมวลกาย",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text("Body Mass Index",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)))
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 24, right: 31),
                                child: Text("=",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700))),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text("น้ำหนัก",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.transparent,
                                        shadows: [
                                          Shadow(
                                              offset: Offset(0, -10),
                                              color: Colors.black),
                                        ],
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.black,
                                        decorationThickness: 3))),
                            Padding(
                                padding: EdgeInsets.only(),
                                child: Text("ส่วนสูง",
                                    style: TextStyle(fontSize: 16)))
                          ])
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "น้ำหนักของคุณอยู่ในเกณฑ์",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: (valBMI >= 30)
                                ? 265
                                : (valBMI >= 25 && valBMI <= 29.9)
                                ? 216
                                : (valBMI >= 23 && valBMI <= 24.9)
                                ? 246
                                : (valBMI >= 18.5 && valBMI <= 22.9)
                                ? 223
                                : 204,
                          height: 54,
                          child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: (valBMI >= 30)
                                ? const Color.fromRGBO(255, 59, 59, 1)
                                : (valBMI >= 25 && valBMI <= 29.9)
                                ? const Color.fromRGBO(255, 148, 87, 1)
                                : (valBMI >= 23 && valBMI <= 24.9)
                                ? const Color.fromRGBO( 255, 208, 87, 1)
                                : (valBMI >= 18.5 && valBMI <= 22.9)
                                ? const Color.fromRGBO(255, 208, 87, 1)
                                : const Color.fromRGBO(98, 233, 35, 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              )),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              (valBMI >= 30)
                                ? ">= 30 โรคอ้วน"
                                : (valBMI >= 25 && valBMI <= 29.9)
                                ? "25 - 29.9 โรคอ้วน"
                                : (valBMI >= 23 && valBMI <= 24.9)
                                ? "23 - 24.9 น้ำหนักเกิน"
                                : (valBMI >= 18.5 && valBMI <= 22.9)
                                ? "18.5 - 22.9 ปกติ"
                                : "< 18.5 ต่ำกว่าเกณฑ์",
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ), //wait data from database
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: (valBMI >= 30)
                                ? const FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          color: Color.fromRGBO(155, 6, 6, 1),
                        )
                                : (valBMI >= 25 && valBMI <= 29.9)
                                ? const FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          color: Color.fromRGBO(206, 101, 25, 1),
                        )
                                : (valBMI >= 23 && valBMI <= 24.9)
                                ? const FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          color: Color.fromRGBO(222, 192, 32, 1),
                        )
                                : (valBMI >= 18.5 && valBMI <= 22.9)
                                ? const FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          color: Color.fromRGBO(44, 169, 13, 1),
                        )
                                : const FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          color: Color.fromRGBO(44, 169, 13, 1),
                        )
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: Container(
                  height: 158,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 56,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 7, top: 23, right: 1),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 208, 87, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "< 18.5 ต่ำกว่าเกณฑ์",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 56,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 1, top: 23, right: 7),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 208, 87, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "23 - 24.9 น้ำหนักเกิน",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 40,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 7, top: 7, right: 1),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(98, 233, 35, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "18.5 - 22.9 ปกติ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 40,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 1, top: 7, right: 7),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 148, 87, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "25 - 29.9 โรคอ้วน",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 40,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 7, top: 7, right: 1),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 38,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 1, top: 5, right: 7),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 60, 60, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      )),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      ">= 30 โรคอ้วน",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160, bottom: 46),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFED7E7E)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {
                    widget.user.bmi =
                        calculateBMI(widget.user.weight, widget.user.height);
                    widget.user.bmr = calculateBMR(
                        widget.user.bmi, widget.user.activityLevel);
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Nutrition(user: widget.user)));
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: Text(
                      "ถัดไป",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

double calculateBMI(double weight, double height) {
  double bmi = weight / ((height / 100) * (height / 100));
  return bmi;
}

double calculateBMR(double bmi, int activityLevel) {
  if (activityLevel == 1) {
    return bmi * 1 * 30;
  } else if (activityLevel == 2) {
    return bmi * 1.3 * 30;
  } else {
    return bmi * 1.5 * 30;
  }
}
