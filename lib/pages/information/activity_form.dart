import 'package:appfood2/widgets/wide_dropdown.dart';
import 'package:appfood2/widgets/small_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> frequency = ["1", "2", "3", "4", "5", "6", "7"];
List<String> lightActivities = ["ดูโทรทัศน์", "นอนหลับ", "สวดมนต์"];

class ActivityForm extends StatefulWidget {
  const ActivityForm({super.key});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ActivityForm")),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const Column(
              children: [
                ActivityFormHeader(),
                ActivityFormBody(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ActivityFormBody extends StatefulWidget {
  const ActivityFormBody({
    super.key,
  });

  @override
  State<ActivityFormBody> createState() => _ActivityFormBodyState();
}

class Activity {
  String name;
  int frequency;
  Activity({
    required this.name,
    required this.frequency,
  });
}

class _ActivityFormBodyState extends State<ActivityFormBody> {
  List<Activity> activities = [
    Activity(name: "", frequency: 1),
    Activity(name: "", frequency: 1),
    Activity(name: "", frequency: 1),
  ];
  Activity tempActivity = Activity(name: "", frequency: 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text("1. กิจกรรมระดับเบามาก",
                            style: TextStyle(fontSize: 22)),
                        Icon(Icons.question_mark_outlined),
                      ],
                    ),
                  ),
                ),
                WideDropDown(
                  data: lightActivities,
                  color: const Color(0xFFFFD7D7),
                  setSelectedItem: (String val) {
                    setState(() {
                      activities[0].name = val;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: [
                      SmallDropDown(
                        data: frequency,
                        dropdownColor: const Color(0xFFFFEBEB),
                        buttonColor: const Color(0xFFFFEBEB),
                        setSelectedItem: (String val) {
                          setState(() {
                            activities[0].frequency = int.parse(val);
                          });
                        },
                      ),
                      const Text(
                        "ครั้ง/สัปดาห์",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("2. กิจกรรมระดับเบา", style: TextStyle(fontSize: 22)),
                    Icon(Icons.question_mark_outlined),
                  ],
                ),
              ),
            ),
            WideDropDown(
              data: lightActivities,
              color: const Color(0xFFFFD7D7),
              setSelectedItem: (String val) {
                setState(() {
                  activities[1].name = val;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: [
                  SmallDropDown(
                    data: frequency,
                    dropdownColor: const Color(0xFFFFEBEB),
                    buttonColor: const Color(0xFFFFEBEB),
                    setSelectedItem: (String val) {
                      setState(() {
                        activities[1].frequency = int.parse(val);
                      });
                    },
                  ),
                  const Text(
                    "ครั้ง/สัปดาห์",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("3. กิจกรรมระดับปานกลาง",
                        style: TextStyle(fontSize: 22)),
                    Icon(Icons.question_mark_outlined),
                  ],
                ),
              ),
            ),
            WideDropDown(
              data: lightActivities,
              color: const Color(0xFFFFD7D7),
              setSelectedItem: (String val) {
                setState(() {
                  activities[2].name = val;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                children: [
                  SmallDropDown(
                    data: frequency,
                    dropdownColor: const Color(0xFFFFEBEB),
                    buttonColor: const Color(0xFFFFEBEB),
                    setSelectedItem: (String val) {
                      setState(() {
                        activities[2].frequency = int.parse(val);
                      });
                    },
                  ),
                  const Text(
                    "ครั้ง/สัปดาห์",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 180,
              child: FloatingActionButton.extended(
                icon:
                    const Icon(CupertinoIcons.plus_circle, color: Colors.black),
                foregroundColor: const Color(0xFFFFD18B),
                splashColor: const Color(0xFFFFD18B),
                elevation: 0,
                backgroundColor: const Color(0x00000000),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: const Color(0xFFFFD18B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              height: 214,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "กิจกรรมที่ทำ",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 18),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 20),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "พาสุนัขไปเดินเล่น",
                                          hintStyle:
                                              TextStyle(color: Colors.red)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text("จำนวน"),
                                      SmallDropDown(
                                          data: frequency,
                                          setSelectedItem: (String val) {
                                            setState(() {
                                              tempActivity.frequency =
                                                  int.parse(val);
                                            });
                                          }),
                                      const Text("ครั้ง/สัปดาห์"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                label: const Text(
                  "เพิ่มกิจกรรม",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            )
          ],
        ));
  }
}

class ActivityFormHeader extends StatelessWidget {
  const ActivityFormHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E807A),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 71),
                      child: Text(
                        "บันทึกกิจกรรม",
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ),
                  ),
                )),
            const Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  "ของคุณ\"แจ่มใส\"",
                  style: TextStyle(fontSize: 28),
                ))),
          ],
        ));
  }
}
