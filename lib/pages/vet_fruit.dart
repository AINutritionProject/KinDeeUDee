import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:appfood2/pages/vet_ab.dart';

class VetFruitPage extends StatelessWidget {
  const VetFruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vet Fruit Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VetABPage(
                        type: "A",
                      )));
            },
            icon: const Icon(Icons.one_k),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VetABPage(
                        type: "B",
                      )));
            },
            icon: const Icon(Icons.two_k),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(247, 252, 241, 1)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1000,
                
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: const AlignmentDirectional(0,0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.54,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(195, 241, 142, 1),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            constraints: const BoxConstraints(
                              minHeight: 50,
                              maxHeight: 65,
                              minWidth: 200,
                              maxWidth: 350
                            ),
                            child: const Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'ผักและผลไม้',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
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
                        height: 100,
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: DottedBorder(
                            color: const Color.fromRGBO(195, 241, 142, 1),
                            strokeWidth: 5,
                            dashPattern: const [10, 10],
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Stack(
                                children: [
                                  const Align(
                                    alignment: AlignmentDirectional(0, -0.9),
                                    child: Text(
                                      'ผัก',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: AlignmentDirectional(0, -0.65),
                                    child: Text(
                                      'วันละ 3 ทัพพี',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(68, 126, 98, 1)
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: AlignmentDirectional(0, -0.4),
                                    child: Text(
                                      'ผลไม้',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(255, 94, 84, 1)
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: AlignmentDirectional(0, -0.15),
                                    child: Text(
                                      '2-4 ส่วน',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(253, 97, 172, 1)
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0.7),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      height: MediaQuery.of(context).size.height * 0.17,
                                      child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'รับประทานปริมาณรองลง',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'มาเพื่อให้ได้รับ',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                'วิตามิน',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(21, 160, 60, 1)
                                                ),
                                              ),
                          
                                            ],
                                          ),
                                          Text(
                                            'แร่ธาตุ และใยอาหาร',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(21, 160, 60, 1)
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
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: 
                        Stack(
                          children: [
                            const Align(
                              alignment: AlignmentDirectional(0, -0.9),
                              child: Text(
                                'ผักจัดแบ่งเป็น 2 ประเภท',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            const Align(
                              alignment: AlignmentDirectional(0, -0.78),
                              child: Text(
                                'ที่ให้พลังงานแตกต่างกัน',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-0.6, -0.4),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const VetABPage(
                                            type: "A",
                                          )));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.28,
                                  height: MediaQuery.of(context).size.height * 0.092,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(176, 243, 183, 1),
                                    boxShadow: const [
                                      BoxShadow(
                                      blurRadius: 0,
                                      color: Color.fromRGBO(141, 202, 147, 1),
                                      offset: Offset(7, -7),
                                      spreadRadius: 2.7
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    //shape: BoxShape.rectangle
                                  ),
                                  child: const Align(
                                    alignment: AlignmentDirectional(0, -0.35),
                                    child: Text(
                                      'ผัก ก',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.6, -0.4),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const VetABPage(
                                            type: "A",
                                          )));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.28,
                                  height: MediaQuery.of(context).size.height * 0.092,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(245, 239, 178, 1),
                                    boxShadow: const [
                                      BoxShadow(
                                      blurRadius: 0,
                                      color: Color.fromRGBO(216, 210, 148, 1),
                                      offset: Offset(7, -7),
                                      spreadRadius: 2.7
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    
                                  ),
                                  child: const Align(
                                    alignment: AlignmentDirectional(0, -0.45),
                                    child: Text(
                                      'ผัก ข',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0.65),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: MediaQuery.of(context).size.height * 0.12,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(-0.6, 0),
                                      child: Image.asset(
                                      'assets/images/FlagNutrition/vegetable2.png',
                                      width: 120,
                                      height: 120,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.6, 0),
                                      child: Image.asset(
                                      'assets/images/FlagNutrition/vegetable1.png',
                                      width: 120,
                                      height: 120,
                                      ),
                                    ),
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
            ],
          ),
        ),
      )
    );
  }
}
