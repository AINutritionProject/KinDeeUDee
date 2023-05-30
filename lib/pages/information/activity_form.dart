import 'package:appfood2/widgets/wide_dropdown.dart';
import 'package:appfood2/widgets/small_dropdown.dart';
import 'package:appfood2/pages/information/activity_result.dart';
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
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: Stack(alignment: Alignment.bottomCenter, children: [
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: const Column(
                    children: [
                      ActivityFormHeader(),
                      ActivityFormBody(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xFFFFD18B)),
                        child: FloatingActionButton.extended(
                          icon: const Icon(CupertinoIcons.plus_circle,
                              color: Colors.black),
                          foregroundColor: const Color(0xFFFFD18B),
                          splashColor: const Color(0xFFFFD18B),
                          elevation: 0,
                          backgroundColor: const Color(0x00000000),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: const Color(0x00FFFFFF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFD18B),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "กิจกรรมที่ทำ",
                                                style: TextStyle(fontSize: 22),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                    vertical: 10),
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 0,
                                                              horizontal: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      hintText:
                                                          "พาสุนัขไปเดินเล่น",
                                                      hintStyle: TextStyle(
                                                          color: Colors.red)),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text("จำนวน"),
                                                  SmallDropDown(
                                                      data: frequency,
                                                      setSelectedItem:
                                                          (String val) {
                                                        setState(() {
                                                          // ignore: prefer_typing_uninitialized_variables
                                                          var tempActivity;
                                                          tempActivity
                                                                  .frequency =
                                                              int.parse(val);
                                                        });
                                                      }),
                                                  const Text("ครั้ง/สัปดาห์"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                )),
                                                backgroundColor:
                                                    const MaterialStatePropertyAll(
                                                        Color(0xFF7D90F3)),
                                              ),
                                              onPressed: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 13),
                                                child: Text(
                                                  "เพิ่ม",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          label: const Text(
                            "เพิ่มกิจกรรม",
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFFED7E7E)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ))),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ActivityResult()));
                        });
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        child: Text(
                          "ถัดไป",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        }),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text(
              "*ไม่จำเป็นต้องกรอกครบทุกช่อง",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          ActivityDisplay(
            title: "1. กิจกรรมระดับเบามาก",
            nameColor: const Color(0xFFFFD7D7),
            frequencyColor: const Color(0xFFFFEBEB),
            data: lightActivities,
            setSelectedName: (String val) {
              setState(() {
                activities[0].name = val;
              });
            },
            setSelectedFrequency: (String val) {
              activities[0].frequency = int.parse(val);
            },
          ),
          ActivityDisplay(
            title: "2. กิจกรรมระดับเบา",
            nameColor: const Color(0xFFFFD7D7),
            frequencyColor: const Color(0xFFFFEBEB),
            data: lightActivities,
            setSelectedName: (String val) {
              setState(() {
                activities[1].name = val;
              });
            },
            setSelectedFrequency: (String val) {
              activities[1].frequency = int.parse(val);
            },
          ),
          ActivityDisplay(
            title: "3. กิจกรรมระดับปานกลาง",
            nameColor: const Color(0xFFFFD7D7),
            frequencyColor: const Color(0xFFFFEBEB),
            data: lightActivities,
            setSelectedName: (String val) {
              setState(() {
                activities[2].name = val;
              });
            },
            setSelectedFrequency: (String val) {
              activities[2].frequency = int.parse(val);
            },
          ),
        ],
      ),
    );
  }
}

class ActivityDisplay extends StatefulWidget {
  final String title;
  final Function(String val) setSelectedName;
  final Function(String val) setSelectedFrequency;
  final Color nameColor;
  final Color frequencyColor;
  final IconData titleIcon;
  final List<String> data;
  const ActivityDisplay(
      {super.key,
      this.title = "",
      required this.setSelectedName,
      required this.setSelectedFrequency,
      required this.data,
      this.nameColor = Colors.white,
      this.frequencyColor = Colors.white,
      this.titleIcon = Icons.question_mark_outlined});

  @override
  State<ActivityDisplay> createState() => _ActivityDisplayState();
}

class _ActivityDisplayState extends State<ActivityDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(widget.title, style: const TextStyle(fontSize: 22)),
                Icon(widget.titleIcon),
              ],
            ),
          ),
        ),
        WideDropDown(
          data: widget.data,
          color: widget.nameColor,
          setSelectedItem: widget.setSelectedName,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            children: [
              SmallDropDown(
                data: frequency,
                dropdownColor: widget.frequencyColor,
                buttonColor: widget.frequencyColor,
                setSelectedItem: widget.setSelectedFrequency,
              ),
              const Text(
                "ครั้ง/สัปดาห์",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ],
    );
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
                          EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                      child: Text(
                        "บันทึกกิจกรรม",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )),
            const Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  "ของคุณ\"แจ่มใส\"",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ))),
          ],
        ));
  }
}
