import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appfood2/auth.dart';
import 'package:appfood2/pages/information/nutrition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../register_success.dart';

class BMI extends StatefulWidget {
  final String username;
  // ignore: non_constant_identifier_names
  final double width_STbmi;
  // ignore: non_constant_identifier_names
  final String Statusbmi;
  // ignore: non_constant_identifier_names
  final List<int> Bgcolor;
  // ignore: non_constant_identifier_names
  final List<int> Stcolor;
  const BMI({
    super.key,
    required this.username,
    // ignore: non_constant_identifier_names
    required this.Bgcolor,
    // ignore: non_constant_identifier_names
    required this.Statusbmi,
    // ignore: non_constant_identifier_names
    required this.Stcolor,
    // ignore: non_constant_identifier_names
    required this.width_STbmi,
  });

  @override
  State<BMI> createState() => _BMIState();
}

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Future<Map<String, dynamic>> _checkIfUserHasData() async {
    final user = FirebaseAuth.instance.currentUser;
    const valBMI = 33.5; // get from data base     (backend help me please)
    // ignore: non_constant_identifier_names
    double width_STbmi = 200;
    // ignore: non_constant_identifier_names
    List<int> Bgcolor = [0, 0, 0];
    // ignore: non_constant_identifier_names
    List<int> Stcolor = [0, 0, 0];
    // ignore: non_constant_identifier_names
    String Statusbmi = "";
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: user!.uid)
        .get();
    if (valBMI >= 30) {
      Bgcolor[0] = 255;
      Bgcolor[1] = 175;
      Bgcolor[2] = 175;
      Stcolor[0] = 255;
      Stcolor[1] = 59;
      Stcolor[2] = 59;
      width_STbmi = 260;
      Statusbmi = ">= 30 โรคอ้วน";
    } else if (valBMI >= 25 && valBMI <= 29.9) {
      Bgcolor[0] = 255;
      Bgcolor[1] = 208;
      Bgcolor[2] = 193;
      Stcolor[0] = 255;
      Stcolor[1] = 148;
      Stcolor[2] = 87;
      width_STbmi = 210;
      Statusbmi = "25 - 29.9 โรคอ้วน";
    } else if (valBMI >= 23 && valBMI <= 24.9) {
      Bgcolor[0] = 255;
      Bgcolor[1] = 245;
      Bgcolor[2] = 220;
      Stcolor[0] = 255;
      Stcolor[1] = 208;
      Stcolor[2] = 87;
      width_STbmi = 240;
      Statusbmi = "23 - 24.9 น้ำหนักเกิน";
    } else if (valBMI >= 18.5 && valBMI <= 22.9) {
      Bgcolor[0] = 217;
      Bgcolor[1] = 255;
      Bgcolor[2] = 200;
      Stcolor[0] = 98;
      Stcolor[1] = 233;
      Stcolor[2] = 35;
      width_STbmi = 220;
      Statusbmi = "18.5 - 22.9 ปกติ";
    } else if (valBMI < 18.5) {
      Bgcolor[0] = 255;
      Bgcolor[1] = 245;
      Bgcolor[2] = 220;
      Stcolor[0] = 255;
      Stcolor[1] = 208;
      Stcolor[2] = 87;
      Statusbmi = "< 18.5 ต่ำกว่าเกณฑ์";
    }
    return {
      'hasData': userData.docs.first.get("hasData"),
      'username': userData.docs.first.get("username"),
      "Bgcolor": Bgcolor,
      "Statusbmi": Statusbmi,
      "Stcolor": Stcolor,
      "width_STbmi": width_STbmi
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?['hasData'] == true) {
            return BMI(
              username: snapshot.data?['username'],
              Bgcolor: snapshot.data?['Bgcolor'],
              Statusbmi: snapshot.data?['Statusbmi'],
              Stcolor: snapshot.data?['Stcolor'],
              width_STbmi: snapshot.data?['width_STbmi'],
            );
          } else {
            return const RegisterSuccesPage();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: _checkIfUserHasData(),
    );
  }
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
        actions: [
          IconButton(
              onPressed: () async {
                await Auth().signOut();
              },
              icon: const Icon(Icons.tv))
        ],
      ),
      backgroundColor: Color.fromRGBO(
          widget.Bgcolor[0], widget.Bgcolor[1], widget.Bgcolor[2], 1),
      body: SingleChildScrollView(
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
                            widget.username,
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
                                    fontSize: 16, fontWeight: FontWeight.w700),
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
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widget.width_STbmi,
                      height: 57,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(widget.Stcolor[0],
                                widget.Stcolor[1], widget.Stcolor[2], 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            )),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.Statusbmi,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ), //wait data from database
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: FaIcon(
                        FontAwesomeIcons.thumbsUp,
                        color: Color.fromRGBO(44, 169, 13, 1),
                      ),
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
              padding: EdgeInsets.only(top: 160, bottom: 46),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFFED7E7E)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Nutrition()));
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
    );
  }
}
