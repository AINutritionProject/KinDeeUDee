import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/add_eat_history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class EatHistoryComponent extends StatelessWidget {
  const EatHistoryComponent({super.key, required this.historySlots});
  final List<HistorySlot> historySlots;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            child: Column(children: [
      SizedBox(
          height: 122,
          width: double.infinity,
          child: DecoratedBox(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(255, 214, 113, 1)),
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
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.skip_previous,
                                size: 35, color: Colors.red),
                          ),
                        ),
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
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
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
          height: 88,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color.fromRGBO(200, 211, 239, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("วันที่",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700)),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("เดือน",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ปี",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        )
                      ],
                    ))
              ],
            ),
          )),
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
    ])));
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
