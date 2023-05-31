import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:appfood2/pages/vet_ab.dart';
import 'package:appfood2/widgets/button_back.dart';

class VetFruitPage extends StatelessWidget {
  const VetFruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(247, 252, 241, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Align(
                                alignment: AlignmentDirectional(-1,-1),
                                child: ButtonBack(colorCircle: Color.fromRGBO(130, 151, 223, 1), color: Colors.white,)),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(195, 241, 142, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  'ผักและผลไม้',
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 30),
                        child: DottedBorder(
                          color: const Color.fromRGBO(195, 241, 142, 1),
                          strokeWidth: 5,
                          dashPattern: const [10, 10],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'ผัก',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'วันละ 3 ทัพพี',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(68, 126, 98, 1)),
                                ),
                                Text(
                                  'ผลไม้',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 94, 84, 1)),
                                ),
                                Text(
                                  '2-4 ส่วน',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(253, 97, 172, 1)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'รับประทานปริมาณรองลง',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'มาเพื่อให้ได้รับ',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'วิตามิน',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  21, 160, 60, 1)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'แร่ธาตุ และใยอาหาร',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(21, 160, 60, 1)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Text(
                              'ผักจัดแบ่งเป็น 2 ประเภท\nที่ให้พลังงานแตกต่างกัน',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold, height: 1.6),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const VetABPage(
                                              type: "A",
                                            )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 25),
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(176, 243, 183, 1),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 0,
                                              color:
                                                  Color.fromRGBO(141, 202, 147, 1),
                                              offset: Offset(7, -7),
                                              spreadRadius: 2.7)
                                        ],
                                        borderRadius: BorderRadius.circular(30),
                                        //shape: BoxShape.rectangle
                                      ),
                                      child: const Text(
                                        'ผัก ก',
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const VetABPage(
                                              type: "B",
                                            )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 25),
                                      decoration: BoxDecoration(
                                        color:
                                            const Color.fromRGBO(245, 239, 178, 1),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 0,
                                              color:
                                                  Color.fromRGBO(216, 210, 148, 1),
                                              offset: Offset(7, -7),
                                              spreadRadius: 2.7)
                                        ],
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Text(
                                        'ผัก ข',
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 90, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/FlagNutrition/vegetable2.png',
                                  width: 120,
                                  height: 120,
                                ),
                                Image.asset(
                                  'assets/images/FlagNutrition/vegetable1.png',
                                  width: 120,
                                  height: 120,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
