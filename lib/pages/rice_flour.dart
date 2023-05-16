import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RiceFlourPage extends StatelessWidget {
  const RiceFlourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rice Flour Page")),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(246, 245, 242, 1)
              ),
              child: Align(
                alignment: const AlignmentDirectional(0,0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 215, 171, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: 100,
                    minHeight: 50,
                  ),
                  child: const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'ข้าว-แป้ง',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            )
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(246, 245, 242, 1)
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, -0.9),
                    child: DottedBorder(
                      color: const Color.fromRGBO(238, 215, 171, 1),
                      strokeWidth: 4,
                      dashPattern: const [10, 10],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 325,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text(
                                'วันละ 5 - 9 ทัพพี',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(214, 125, 99, 1)
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'เฉลี่ย 3 มื้อ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                              child: Text(
                                'เป็นแหล่งพลังงานหลักและ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text(
                              'ควรเลือกชนิดที่ขัดสีน้อย',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              
                            ),
                            Text(
                              'ให้สารอาหารหลักคือ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              
                            ),
                            Text(
                              'คาร์โบไฮเดรต',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(125, 144, 212, 1)                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0.4),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 100,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-0.65, 0),
                            child: Image.asset(
                              'assets/images/FlagNutrition/flour.png',
                              width: 120,
                              height: 80,
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.65, 0),
                            child: Image.asset(
                              'assets/images/FlagNutrition/rice.png',
                              width: 120,
                              height: 80,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            )
          )
        ],
      )
    );
  }
}
