import 'package:flutter/material.dart';
import 'package:appfood2/db.dart';
import 'bmi.dart';

class MilkPage extends StatefulWidget {
  final User user;
  const MilkPage({
    super.key,
    required this.user,
  });

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  // ignore: non_constant_identifier_names
  bool status_milk0 = false;
  // ignore: non_constant_identifier_names
  bool status_milk1 = false;
  // ignore: non_constant_identifier_names
  bool status_milk2 = false;
  // ignore: non_constant_identifier_names
  bool status_eat0 = false;
  // ignore: non_constant_identifier_names
  bool status_eat1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 23, right: 23, top: 34),
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
                        (status_milk0)
                            ? Image.asset(
                                "assets/images/drink_eat/no_drink.png")
                            : Image.asset("assets/images/drink_eat/drink.png"),
                        (status_eat0)
                            ? Image.asset("assets/images/drink_eat/no_eat.png")
                            : Image.asset("assets/images/drink_eat/eat.png")
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 57, right: 22),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: status_milk0
                                      ? const Color.fromRGBO(131, 255, 158, 1)
                                      : (!(status_milk0 ||
                                              status_milk1 ||
                                              status_milk2 ||
                                              status_eat0 ||
                                              status_eat1))
                                          ? const Color.fromRGBO(
                                              254, 194, 181, 1)
                                          : const Color.fromRGBO(
                                              206, 206, 206, 1),
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              onPressed: () {
                                setState(
                                  () {
                                    status_milk0 = !status_milk0;
                                    status_milk1 = false;
                                    status_milk2 = false;
                                  },
                                );
                              },
                              child: const Text("ไม่ดื่ม",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60, left: 23),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: status_eat0
                                      ? const Color.fromRGBO(131, 255, 158, 1)
                                      : (!(status_milk0 ||
                                              status_milk1 ||
                                              status_milk2 ||
                                              status_eat0 ||
                                              status_eat1))
                                          ? const Color.fromRGBO(
                                              254, 194, 181, 1)
                                          : const Color.fromRGBO(
                                              206, 206, 206, 1),
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              onPressed: () {
                                setState(
                                  () {
                                    status_eat0 = !status_eat0;
                                    status_eat1 = false;
                                  },
                                );
                              },
                              child: const Text(
                                "ไม่ทาน",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 57, right: 22, top: 30),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: status_milk1
                                      ? const Color.fromRGBO(131, 255, 158, 1)
                                      : (!(status_milk0 ||
                                              status_milk1 ||
                                              status_milk2 ||
                                              status_eat0 ||
                                              status_eat1))
                                          ? const Color.fromRGBO(
                                              226, 248, 255, 1)
                                          : const Color.fromRGBO(
                                              206, 206, 206, 1),
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              onPressed: () {
                                setState(
                                  () {
                                    status_milk1 = !status_milk1;
                                    status_milk0 = false;
                                    status_milk2 = false;
                                  },
                                );
                              },
                              child: const Text(
                                "1 แก้ว",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 60, left: 23, top: 30),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: status_eat1
                                      ? const Color.fromRGBO(131, 255, 158, 1)
                                      : (!(status_milk0 ||
                                              status_milk1 ||
                                              status_milk2 ||
                                              status_eat0 ||
                                              status_eat1))
                                          ? const Color.fromRGBO(
                                              253, 255, 164, 1)
                                          : const Color.fromRGBO(
                                              206, 206, 206, 1),
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              onPressed: () {
                                setState(
                                  () {
                                    status_eat1 = !status_eat1;
                                    status_eat0 = false;
                                  },
                                );
                              },
                              child: const Text(
                                "ทาน",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 57, right: 22, top: 30),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: status_milk2
                                      ? const Color.fromRGBO(131, 255, 158, 1)
                                      : (!(status_milk0 ||
                                              status_milk1 ||
                                              status_milk2 ||
                                              status_eat0 ||
                                              status_eat1))
                                          ? const Color.fromRGBO(
                                              226, 248, 255, 1)
                                          : const Color.fromRGBO(
                                              206, 206, 206, 1),
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              onPressed: () {
                                setState(
                                  () {
                                    status_milk2 = !status_milk2;
                                    status_milk0 = false;
                                    status_milk1 = false;
                                  },
                                );
                              },
                              child: const Text(
                                "2 แก้ว",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        )),
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
                                    color: Colors.black),
                              ),
                            )))
                  ],
                ),
                Visibility(
                    visible: ((status_eat0 || status_eat1) &&
                        (status_milk0 || status_milk1 || status_milk2)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 140, right: 140, top: 150, bottom: 70),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(135, 228, 234, 1),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          onPressed: () => {
                                setState(() {
                                  if (status_milk0) {
                                    widget.user.milkGlass = 0;
                                  } else if (status_milk1) {
                                    widget.user.milkGlass = 1;
                                  } else if (status_milk2) {
                                    widget.user.milkGlass = 2;
                                  }
                                  if (status_eat0) {
                                    widget.user.milkProduct = false;
                                  } else if (status_eat1) {
                                    widget.user.milkProduct = true;
                                  }
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          BMIPage(user: widget.user)));
                                })
                              },
                          child: const Text(
                            "ถัดไป",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ))
              ],
            ),
          ),
        ));
  }
}
