import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/widgets/button_back.dart';

class RiceFlourPage extends StatelessWidget {
  const RiceFlourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 245, 242, 1),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: ButtonBack(
                                colorCircle: Color.fromRGBO(130, 151, 223, 1),
                                color: Colors.white,
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(238, 215, 171, 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              'ข้าว-แป้ง',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DottedBorder(
                          color: const Color.fromRGBO(238, 215, 171, 1),
                          strokeWidth: 4,
                          dashPattern: const [10, 10],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 10),
                            //width: MediaQuery.of(context).size.width * 0.88,
                            //height: 325,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'วันละ 5 - 9 ทัพพี',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(214, 125, 99, 1)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'เฉลี่ย 3 มื้อ',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 35, 0, 0),
                                  child: Text(
                                    'เป็นแหล่งพลังงานหลักและ',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  'ควรเลือกชนิดที่ขัดสีน้อย',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'ให้สารอาหารหลักคือ',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'คาร์โบไฮเดรต',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(125, 144, 212, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: SizedBox(
                            //width: MediaQuery.of(context).size.width * 0.8,
                            //height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/FlagNutrition/flour.png',
                                  width: 160,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 30,
                                  height: 30,
                                ),
                                Image.asset(
                                  'assets/images/FlagNutrition/rice.png',
                                  width: 160,
                                  height: 80,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
