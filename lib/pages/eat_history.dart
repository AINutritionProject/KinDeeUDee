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
      appBar: AppBar(title: const Text("Eat History")),
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
      child: Column(
        children: [
          
          ...historySlots,
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            color: historySlots.length % 2 == 0
                ? Colors.yellow.shade100
                : Colors.green.shade200,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    historySlots.length.toString(),
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
          )
        ],
      ),
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
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.15,
      color: widget.number % 2 == 0
          ? Colors.yellow.shade100
          : Colors.green.shade200,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Text(
              widget.number.toString(),
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
