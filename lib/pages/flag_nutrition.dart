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
              height: 1000,
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
                          child: Text('Data'),
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
                            flex: 4,
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
                                        ),
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
