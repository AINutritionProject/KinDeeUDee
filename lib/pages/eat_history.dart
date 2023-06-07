// ignore_for_file: dead_code
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/add_eat_history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appfood2/widgets/button_back.dart';

class EatHistoryPage extends StatefulWidget {
  const EatHistoryPage({super.key});

  @override
  State<EatHistoryPage> createState() => _EatHistoryPageState();
}

class _EatHistoryPageState extends State<EatHistoryPage> {
  Future<List<HistorySlot>> _getHistoryData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final historyData = await FirebaseFirestore.instance
        .collection("eatHistory")
        .where("uid", isEqualTo: uid)
        .get();
    List<HistorySlot> historySlots = [];
    for (var i = 0; i < historyData.docs.length; i++) {
      final history = historyData.docs[i];
      historySlots.add(HistorySlot(
        number: i,
        image: history["foodPhoto"],
        unit: history["unit"],
        foodName: history["foodName"],
        quantity: history["quantity"],
        timestamp: history["timestamp"],
      ));
    }
    return historySlots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return EatHistoryComponent(historySlots: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error} ?? `ERR`");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        future: _getHistoryData(),
      ),
    );
  }
}

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  // ignore: non_constant_identifier_names
  bool Buttondate = false;
  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  // ignore: non_constant_identifier_names
  List<String> Mont = [
    "ม.ค.",
    "ก.พ.",
    "มี.ค.",
    "เม.ย.",
    "พ.ค.",
    "มิ.ย.",
    "ก.ค.",
    "ส.ค.",
    "ก.ย.",
    "ต.ค.",
    "พ.ย.",
    "ธ.ค."
  ];
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(200, 211, 239, 1)),
        ),
        onPressed: () async {
          DateTime? newDate1 = await showDatePicker(
              context: context,
              initialDate: date1,
              firstDate: DateTime(2015, 8),
              lastDate: DateTime(2101),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData(
                    primarySwatch: Colors.grey,
                    splashColor: Colors.black,
                    textTheme: const TextTheme(
                      titleMedium: TextStyle(color: Colors.black),
                      labelLarge: TextStyle(color: Colors.black),
                    ),
                    hintColor: Colors.black,
                    colorScheme: ColorScheme.light(
                        primary: Colors.green.shade500,
                        onSecondary: Colors.black,
                        onPrimary: Colors.white,
                        surface: Colors.black,
                        onSurface: Colors.black,
                        secondary: Colors.black),
                    dialogBackgroundColor: Colors.white,
                  ),
                  child: child ?? const Text(""),
                );
              });
          if (newDate1 != null) {
            // ignore: use_build_context_synchronously
            DateTime? newDate2 = await showDatePicker(
                context: context,
                initialDate: date2,
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData(
                      primarySwatch: Colors.grey,
                      splashColor: Colors.black,
                      textTheme: const TextTheme(
                        titleMedium: TextStyle(color: Colors.black),
                        labelLarge: TextStyle(color: Colors.black),
                      ),
                      hintColor: Colors.black,
                      colorScheme: const ColorScheme.light(
                          primary: Color(0xffffbc00),
                          onSecondary: Colors.black,
                          onPrimary: Colors.white,
                          surface: Colors.black,
                          onSurface: Colors.black,
                          secondary: Colors.black),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child ?? const Text(""),
                  );
                });
            if (newDate2 != null) {
              setState(
                () {
                  Buttondate = true;
                  date1 = newDate1;
                  date2 = newDate2;
                },
              );
            }
          }
        },
        child: (Buttondate)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("วันที่",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(52, 52, 52, 1))),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                (date1.day == date2.day)
                                    ? date1.day.toString()
                                    : "${date1.day}-${date2.day}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ))
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("เดือน",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(52, 52, 52, 1))),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                (date1.month == date2.month)
                                    ? Mont[date1.month - 1]
                                    : "${Mont[date1.month - 1]}-${Mont[date2.month - 1]}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ))
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "ปี",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(52, 52, 52, 1)),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                  (date1.year == date2.year)
                                      ? date1.year.toString()
                                      : "${date1.year}-${date2.year}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)))
                        ],
                      ))
                ],
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'เลือกช่วงเวลา',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: Colors.black,
                  )
                ],
              ));
  }
}

class EatHistoryComponent extends StatelessWidget {
  const EatHistoryComponent({super.key, required this.historySlots});
  final List<HistorySlot> historySlots;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: SizedBox(
              child: Column(children: [
        SizedBox(
            height: 122,
            width: double.infinity,
            child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 214, 113, 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 6),
                          child: Container(
                              width: 48,
                              height: 48,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(18, 109, 104, 1),
                                  shape: BoxShape.circle),
                              child: const ButtonBack(
                                colorCircle: Color.fromRGBO(18, 109, 104, 1),
                                color: Colors.white,
                              )),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 109,
                            height: 41,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(125, 144, 243, 1),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "เมนู",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 44, right: 35, top: 10),
                      child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 47,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "ประวัติการรับประทานอาหาร",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                ))),
        const SizedBox(
            width: double.infinity,
            height: 100,
            child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(200, 211, 239, 1)),
                child: SelectDate())),
        Column(
          children: [
            ...historySlots,
            Container(
              width: double.infinity,
              height: 125,
              color: historySlots.length % 2 == 0
                  ? const Color.fromRGBO(134, 251, 166, 0.65)
                  : const Color.fromRGBO(221, 255, 231, 0.65),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Text(
                      (historySlots.length + 1).toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddEatHistoryPage()));
                    },
                    child: const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.plus,
                          size: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "เพิ่มข้อมูล",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]))),
    );
  }
}

class HistorySlot extends StatefulWidget {
  const HistorySlot(
      {super.key,
      required this.number,
      required this.image,
      required this.foodName,
      required this.quantity,
      required this.timestamp,
      required this.unit});
  final int number;
  final String image;
  final String foodName;
  final int quantity;
  final int timestamp;
  final String unit;

  @override
  State<HistorySlot> createState() => _HistorySlotState();
}

class _HistorySlotState extends State<HistorySlot> {
  late String showTime;

  @override
  void initState() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(widget.timestamp);
    showTime = "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, "0")}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 125,
      color: widget.number % 2 == 0
          ? const Color.fromRGBO(134, 251, 166, 0.65)
          : const Color.fromRGBO(221, 255, 231, 0.65),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Text(
              (widget.number + 1).toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(15 * 3),
              child: Image(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.foodName} ${widget.quantity} ${widget.unit}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "เวลา $showTime น.",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
