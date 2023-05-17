import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class MilkMeatPage extends StatelessWidget {
  const MilkMeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meat Page")),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 1400,
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex:1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0,-0.85),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.52,
                          height: MediaQuery.of(context).size.height * 0.085,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(223, 170, 177, 1)
                          ),
                          child: 
                          const Align(
                            alignment: AlignmentDirectional(0,0),
                            child: Text(
                              'เนื้อสัตว์',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, -0.6),
                        child: Text(
                          'เนื้อสัตว์วันละ',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(231, 81, 81, 1)
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, -0.5),
                        child: Text(
                          '6-10 ช้อนโต๊ะ',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(231, 81, 81, 1)
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, -0.3),
                        child: Image.asset(
                          'assets/images/FlagNutrition/animal.png',
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.098,
                          fit: BoxFit.cover,
                        )
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0.05),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          height: MediaQuery.of(context).size.height * 0.12,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(235, 193, 255, 1),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'นมหรือผลิตภัณฑ์',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'จากนม',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0.45),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: const Column(
                            children: [
                              Text(
                                'นม',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'วันละ1-2 แก้ว',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(80, 78, 175, 1)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, 0.65),
                        child: Text(
                          'หรือผลิตภัณฑ์จากนม',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, 0.85),
                        child: Text(
                          'เช่น โยเกิร์ต นมเปรี้ยว ชีส',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(80, 78, 175, 1)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, -0.95),
                        child: Image.asset(
                          //'assets/images/NutritionImg/peanut.png',
                          'assets/images/FlagNutrition/milk_animal.png',
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.width * 0.22,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, -0.45),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(248, 219, 148, 1),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 100,
                            minHeight: 65
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'ถั่ว',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0, -0.15),
                        child: Text(
                          '1 ส่วน',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(140, 72, 10, 1)
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0.2),
                        child: Image.asset(
                          'assets/images/NutritionImg/peanut.png',
                          width: 180,
                          height: 120,
                          fit: BoxFit.cover,
                          ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0.75),
                        child: DottedBorder(
                          color: const Color.fromRGBO(208, 75, 139, 1),
                          strokeWidth: 5,
                          dashPattern: const [10, 10],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.84,
                            height: MediaQuery.of(context).size.height * 0.18,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'รับประทานในปริมาณพอ',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'เหมาะเพื่อให้ได้รับ',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      'โปรตีน',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(226, 43, 43, 1)
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                    'เหล็ก และแคลเซียม',
                                    style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(226, 43, 43, 1)
                                  ),
                                )
                              ],
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
        )
      )
    );
  }
}
