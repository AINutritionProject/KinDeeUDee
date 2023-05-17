import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/add_eat_history.dart';

class EatHistoryPage extends StatelessWidget {
  const EatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eat History")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HistorySlot(
              number: 1,
              image:
                  "https://firebasestorage.googleapis.com/v0/b/app-food-60480.appspot.com/o/profile_pictures%2FiFUvBOrQo3QrChfhyTWsLYvJTrG3?alt=media&token=149d605b-903b-47af-9183-d93828195326",
            ),
            const HistorySlot(
              number: 2,
              image:
                  "https://firebasestorage.googleapis.com/v0/b/app-food-60480.appspot.com/o/profile_pictures%2FiFUvBOrQo3QrChfhyTWsLYvJTrG3?alt=media&token=149d605b-903b-47af-9183-d93828195326",
            ),
            const HistorySlot(
              number: 11,
              image:
                  "https://firebasestorage.googleapis.com/v0/b/app-food-60480.appspot.com/o/profile_pictures%2FiFUvBOrQo3QrChfhyTWsLYvJTrG3?alt=media&token=149d605b-903b-47af-9183-d93828195326",
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              color: Colors.red,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Text(
                      "3",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

class HistorySlot extends StatefulWidget {
  const HistorySlot({super.key, required this.number, required this.image});
  final int number;
  final String image;

  @override
  State<HistorySlot> createState() => _HistorySlotState();
}

class _HistorySlotState extends State<HistorySlot> {
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
          )
        ],
      ),
    );
  }
}
