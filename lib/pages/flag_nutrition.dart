import 'package:flutter/material.dart';
import 'package:appfood2/pages/oil.dart';
import 'package:appfood2/pages/rice_flour.dart';
import 'package:appfood2/pages/vet_fruit.dart';
import 'package:appfood2/pages/milk_meat.dart';

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
                        decoration: BoxDecoration(color: Colors.amber[200]),
                        child: const Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text('โภชนาการ'),
                        )),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.amber[300]),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(color: Colors.pink[100]),
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
                                                    color: Colors.black,
                                                    width: 4)),
                                            child: Stack(
                                              children: [
                                                const Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    'ข้าว-แป้ง',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.8, 0),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/393/600',
                                                      width: 40,
                                                      height: 40,
                                                    )),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.8, 0),
                                                  child: Image.network(
                                                    'https://picsum.photos/seed/864/600',
                                                    width: 40,
                                                    height: 40,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 25,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent[200]),
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
                                                    color: Colors
                                                        .yellowAccent[100],
                                                    border: Border.all(
                                                        width: 4,
                                                        color: Colors.black)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.55, 0),
                                                      child: Text(
                                                        'ผัก',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.55, 0),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/641/600',
                                                        width: 40,
                                                        height: 40,
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
                                                    color: Colors
                                                        .yellowAccent[200],
                                                    border: Border.all(
                                                        width: 4,
                                                        color: Colors.black)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.55, 0),
                                                      child: Text(
                                                        'Hello',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -0.55, 0),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/641/600',
                                                        width: 40,
                                                        height: 40,
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
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent[300]),
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
                                                    color: Colors.blueGrey[200],
                                                    border: Border.all(
                                                        width: 4,
                                                        color: Colors.black)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0.7),
                                                      child: Text(
                                                        'Hello',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, -0.7),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/641/600',
                                                        width: 40,
                                                        height: 40,
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
                                                    color: Colors.blueGrey[300],
                                                    border: Border.all(
                                                        width: 4,
                                                        color: Colors.black)),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0.7),
                                                      child: Text(
                                                        'Hello',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0, -0.7),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/641/600',
                                                        width: 40,
                                                        height: 40,
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
                                    flex: 27,
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
                                            color: Colors.green[400],
                                            border: Border.all(
                                                color: Colors.white, width: 4)),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, -0.7),
                                              child: Image.network(
                                                'https://picsum.photos/seed/632/600',
                                                width: 50,
                                                height: 30,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0.3),
                                              child: Text('Hello World',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            const Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0.8),
                                              child: Text('World',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(color: Colors.pink[200]),
                              child: Stack(
                                children:  [
                                  Align(
                                    alignment: const AlignmentDirectional(0, -0.85),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      height: MediaQuery.of(context).size.height * 0.075,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent[200]
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 100,
                                        minHeight: 60,
                                        maxHeight: 200,
                                        maxWidth: 100
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, -0.45),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent[400]
                                      ),
                                      constraints: const BoxConstraints(
                                        maxWidth: 300,
                                        minHeight: 125,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0.45),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent[600]
                                      ),
                                      constraints: const BoxConstraints(
                                        maxWidth: 200
                                      ),
                                      child: Stack(
                                        children: const [],
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