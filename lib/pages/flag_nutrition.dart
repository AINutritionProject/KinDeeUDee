import 'package:flutter/material.dart';
import 'package:appfood2/pages/oil.dart';
import 'package:appfood2/pages/rice_flour.dart';
import 'package:appfood2/pages/vet_fruit.dart';
import 'package:appfood2/pages/milk_meat.dart';
import 'package:dotted_border/dotted_border.dart';

class FlagNutrition extends StatelessWidget {
  const FlagNutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlagNutrition"),
        //actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1100,
              decoration: BoxDecoration(
                color: Colors.amber[100],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Color.fromRGBO(74, 54, 131, 1)),
                        child: const Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'ธงโภชนาการ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          )
                        ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Color.fromRGBO(74, 54, 131, 1)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 23,
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 5.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RiceFlourPage()));
                                        },
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.86,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            constraints: const BoxConstraints(
                                              minWidth: 200,
                                              maxHeight: 380,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.greenAccent[100],
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 7)),
                                            child: Stack(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    'ข้าว-แป้ง',
                                                    style:
                                                        TextStyle(
                                                          fontSize: 24,
                                                          fontWeight: FontWeight.bold
                                                          ),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.99, 0),
                                                    child: Image.asset(
                                                      'assets/images/FlagNutrition/flour.png',
                                                      width: 120,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                    )),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.9, 0),
                                                  child: Image.asset(
                                                    'assets/images/FlagNutrition/rice.png',
                                                    width: 120,
                                                    height: 60,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const VetFruitPage()));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 3, 5),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(195, 241, 142, 1)
                                                        ,
                                                    border: Border.all(
                                                        width: 7,
                                                        color: Colors.white)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.55, 0),
                                                      child: Text(
                                                        'ผัก',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.bold
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.8, 0),
                                                      child: Image.asset(
                                                        'assets/images/FlagNutrition/vegetable1.png',
                                                        width: 70,
                                                        height: 70,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const VetFruitPage()));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(3, 0, 0, 5),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                decoration: BoxDecoration(
                                                    color: const Color
                                                        .fromRGBO(194, 179, 244, 1),
                                                    border: Border.all(
                                                        width: 7,
                                                        color: Colors.white)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.55, 0),
                                                      child: Text(
                                                        'ผลไม้',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -0.8, 0),
                                                      child: Image.asset(
                                                        'assets/images/FlagNutrition/vegetable2.png',
                                                        width: 70,
                                                        height: 70,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MilkMeatPage()));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 3, 5),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.35,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(175, 216, 247, 1),
                                                    border: Border.all(
                                                        width: 7,
                                                        color: Colors.white)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0.7),
                                                      child: Text(
                                                        'กลุ่มนม',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, -0.9),
                                                      child: Image.asset(
                                                        'assets/images/FlagNutrition/milk_animal.png',
                                                        width: 100,
                                                        height: 44,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MilkMeatPage()));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(3, 0, 0, 5),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(223, 170, 177, 1),
                                                    border: Border.all(
                                                        width: 7,
                                                        color: Colors.white)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0.7),
                                                      child: Text(
                                                        'เนื้อสัตว์',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, -0.9),
                                                      child: Image.asset(
                                                        'assets/images/FlagNutrition/animal.png',
                                                        width: 120,
                                                        height: 48,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 29,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const OilPage()));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(252, 246, 234, 1),
                                            border: Border.all(
                                                color: Colors.white, width: 7)),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, -0.9),
                                              child: Image.asset(
                                                'assets/images/FlagNutrition/oil.png',
                                                width: 70,
                                                height: 46,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0.3),
                                              child: Text('น้ำมัน',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0.8),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                                child: Text('เครื่องปรุง',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children:  [
                                  Align(
                                    alignment: const AlignmentDirectional(0, -0.85),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      height: MediaQuery.of(context).size.height * 0.07,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(200, 234, 241, 1),
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 100,
                                        minHeight: 60,
                                        maxHeight: 200,
                                        maxWidth: 115
                                      ),
                                      child: const Align(
                                        alignment: AlignmentDirectional(0,0),
                                        child: Text(
                                          'น้ำ',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, -0.45),
                                    child: DottedBorder(
                                      color: const Color.fromRGBO(137, 155, 220, 1),
                                      strokeWidth: 5,
                                      dashPattern: const [10, 10],
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(20),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.8,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        constraints: const BoxConstraints(
                                          maxWidth: 300,
                                          minHeight: 125,
                                        ),
                                        child: const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'ควรดื่มน้ำวันละ',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                              '8 แก้ว',
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0.45),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.95,
                                      height: 200,
                                      constraints: const BoxConstraints(
                                        maxHeight: 200
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(0, -0.9),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max ,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(0, 0.6),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max ,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                                Image.asset(
                                                  'assets/images/FlagNutrition/water.png',
                                                  width: 70,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}