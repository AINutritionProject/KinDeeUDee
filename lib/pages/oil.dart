import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class OilPage extends StatelessWidget {
  const OilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Oil Page")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 251, 243, 1)
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.amber[400]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromRGBO(255, 251, 243, 1),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, -0.8),
                            child: 
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(253, 233, 192, 1),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                constraints: const BoxConstraints(
                                  maxHeight: 120,
                                  minHeight: 50,
                                  maxWidth: 280,
                                  minWidth: 200
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'น้ำมัน',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      'ไขมันต่างๆ',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0.75),
                            child: DottedBorder(
                              color: const Color.fromRGBO(253, 232, 192, 1),
                              strokeWidth: 5,
                              dashPattern: const [10, 10],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: MediaQuery.of(context).size.height * 0.074,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                constraints: const BoxConstraints(
                                  minHeight: 80,
                                  minWidth: 200,
                                  maxWidth: 240
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0,0),
                                  child: Text(
                                    'วันละ 6-8 ช้อนชา',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromRGBO(255, 251, 243, 1),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, -0.8),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.054,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(192, 246, 253, 1),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 260,
                                minHeight: 60
                              ),
                              child: const Align(
                                alignment: AlignmentDirectional(0,0),
                                child: Text(
                                  'น้ำตาล เครื่องปรุงรส',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0.2),
                            child: DottedBorder(
                              color: const Color.fromRGBO(162, 246, 252, 1),
                              strokeWidth: 5,
                              dashPattern: const [10, 10],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.54,
                                height: MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                constraints:  const BoxConstraints(
                                  minHeight: 80
                                ),
                                child: const Align(
                                  alignment: AlignmentDirectional(0,0),
                                  child: Text(
                                    'วันละ 6 ช้อนชา',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold
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
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromRGBO(255, 251, 243, 1),
                      child: Align(
                        alignment: const AlignmentDirectional(0, -0.6),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.07,
                          color: const Color.fromRGBO(255, 251, 243, 1),
                          constraints: const BoxConstraints(
                            minHeight: 90,
                            maxHeight: 200
                          ),
                          child: Image.asset(
                            'assets/images/FlagNutrition/oil.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.scaleDown,
                            ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
