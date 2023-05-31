import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:appfood2/widgets/button_back.dart';

class OilPage extends StatelessWidget {
  const OilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 251, 243, 1),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ButtonBack(colorCircle: Color.fromRGBO(130, 151, 223, 1), color: Colors.white,),
                  )),
              ),
            ),
            Expanded(
              flex: 8,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromRGBO(255, 251, 243, 1),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(253, 233, 192, 1),
                                  borderRadius: BorderRadius.circular(20)
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: DottedBorder(
                                color: const Color.fromRGBO(253, 232, 192, 1),
                                strokeWidth: 5,
                                dashPattern: const [10, 10],
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  
                                  child: const Text(
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
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromRGBO(255, 251, 243, 1),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(192, 246, 253, 1),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                
                                child: const Text(
                                  'น้ำตาล เครื่องปรุงรส',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: DottedBorder(
                                color: const Color.fromRGBO(162, 246, 252, 1),
                                strokeWidth: 5,
                                dashPattern: const [10, 10],
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  
                                  child: const Text(
                                    'วันละ 6 ช้อนชา',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Image.asset(
                          'assets/images/FlagNutrition/oil.png',
                          width: 150,
                          height: 70,
                          fit: BoxFit.scaleDown,
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
    );
  }
}
