import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/nutrition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/db.dart' as db;
import 'package:appfood2/screen_size.dart';

class BMIPage extends StatefulWidget {
  final db.User user;
  final bool isDrawer;
  const BMIPage({
    super.key,
    required this.user,
    this.isDrawer = false,
  });

  @override
  State<BMIPage> createState() => _BMIState();
}

class _BMIState extends State<BMIPage> {
  late String username = widget.user.username;

  late double valBMI = calculateBMI(widget.user.weight, widget.user.height);
  late bool isDrawer = widget.isDrawer;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      // backgroundColor: (valBMI >= 30)
      //     ? const Color.fromRGBO(255, 175, 175, 1)
      //     : (valBMI >= 25 && valBMI <= 29.9)
      //         ? const Color.fromRGBO(255, 208, 193, 1)
      //         : (valBMI >= 23 && valBMI <= 24.9)
      //             ? const Color.fromRGBO(255, 245, 220, 1)
      //             : (valBMI >= 18.5 && valBMI <= 22.9)
      //                 ? const Color.fromRGBO(217, 255, 200, 1)
      //                 : const Color.fromRGBO(255, 245, 220, 1),
      body: SafeArea(
        child: Container(
          //height: screenSizeData.screenHeight,
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
            ? Colors.white
            : Colors.black,
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                minHeight: screenSizeData.screenHeight
              ),
              color: (valBMI >= 30)
                  ? const Color.fromRGBO(255, 175, 175, 1)
                  : (valBMI >= 25 && valBMI <= 29.9)
            ? const Color.fromRGBO(255, 208, 193, 1)
            : (valBMI >= 23 && valBMI <= 24.9)
                ? const Color.fromRGBO(255, 245, 220, 1)
                : (valBMI >= 18.5 && valBMI <= 22.9)
                    ? const Color.fromRGBO(217, 255, 200, 1)
                    : const Color.fromRGBO(255, 245, 220, 1),
              width: screenSizeData.screenSizeWidth,
              height: screenSizeData.screenHeight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only( top:  screenSizeData.maxWidth < 600 ? screenSizeData.screenHeight * 0.1 : screenSizeData.screenHeight * 0.18),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: screenSizeData.screenSizeWidth * 0.4),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: screenSizeData.screenSizeWidth * 0.4),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  
                                  width: 150,
                                  height: 150,
                                  child: Center(
                                    child: Text(
                                      "“$username”",
                                      style: const TextStyle(
                                          fontSize: 36, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
                      child: Container(
                        //height: 92,
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        width: screenSizeData.screenSizeWidth * 0.9,
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
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text("Body Mass Index",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)))
                                ]),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 24, right: 31),
                                      child: Text("=",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))),
                                ]),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text("น้ำหนัก",
                                          style: TextStyle(
                                              fontSize: 20,
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
                                      child: Text("ส่วนสูง²",
                                          style: TextStyle(fontSize: 20)))
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
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: (valBMI >= 30)
                                      ? const Color.fromRGBO(255, 59, 59, 1)
                                      : (valBMI >= 25 && valBMI <= 29.9)
                                          ? const Color.fromRGBO(255, 148, 87, 1)
                                          : (valBMI >= 23 && valBMI <= 24.9)
                                              ? const Color.fromRGBO(
                                                  255, 208, 87, 1)
                                              : (valBMI >= 18.5 && valBMI <= 22.9)
                                                  ? const Color.fromRGBO(
                                                      98, 233, 35, 1)
                                                  : const Color.fromRGBO(
                                                      255, 208, 87, 1),
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
                                      fontSize: 24, fontWeight: FontWeight.bold),
                                ), //wait data from database
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
                                                color:
                                                    Color.fromRGBO(222, 192, 32, 1),
                                              )
                                            : (valBMI >= 18.5 && valBMI <= 22.9)
                                                ? const FaIcon(
                                                    FontAwesomeIcons.thumbsUp,
                                                    
                                                    color: Color.fromRGBO(
                                                        44, 169, 13, 1),
                                                  )
                                                : const FaIcon(
                                                    
                                                    FontAwesomeIcons.thumbsUp,
                                                    
                                                    color: Color.fromRGBO(
                                                        222, 192, 32, 1)))
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                      child: Container(
                        //height: 158,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        //margin: EdgeInsets.symmetric(horizontal: 10),
                        width: screenSizeData.screenSizeWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(249, 255, 226, 1),
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
                                            color: Color.fromRGBO(249, 255, 226, 1),
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
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Visibility(
                        visible: !isDrawer,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 46),
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
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: const Text(
                                "ถัดไป",
                                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
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
