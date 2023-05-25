import 'package:flutter/material.dart';
import 'package:appfood2/widgets/dropdown.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<String> items = <String>['', '1', '2', '3', '4', '5', '6', '7'];
  String dropdownValue = 'Dog';
  String selectedItem = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
        appBar: AppBar(
          title: const Text('Activity Page'),
        ),
        body: const SingleChildScrollView(
            child: SafeArea(
                child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(30, 128, 122, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "บันทึกกิจกรรม",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ), //wait data from database
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Text(
                "ของคุณ “แจ่มใส”",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ), //wait data from database
            ),
            Row(
              children: [
                Center(
                    child: )
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(), child: Text("555")),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 60),
                  child: Text(
                    "ครั้ง/สัปดาห์",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ))));
  }
}
