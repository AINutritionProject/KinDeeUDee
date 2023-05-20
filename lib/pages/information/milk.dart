import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MilkPage extends StatefulWidget {
  const MilkPage({super.key});

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  final int _milk_cout = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
        appBar: AppBar(
          title: const Text('Milk Page'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 23, right: 23, top: 34),
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "คุณดื่มนมหรือรับประทานผลิตภัณฑ์จากนมหรือไม่?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 28, bottom: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/images/drink_eat/drink.png"),
                      Image.asset("assets/images/drink_eat/eat.png")
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 67, right: 32),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "ไม่ดื่ม",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 70, left: 33),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "ไม่ทาน",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 67, right: 32, top: 30),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "1 แก้ว",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 70, left: 33, top: 30),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "ทาน",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 67, right: 32, top: 30),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "2 แก้ว",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 70, left: 33, top: 30),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 251, 242, 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )))
                ],
              ),
            ],
          ),
        ));
  }
}
