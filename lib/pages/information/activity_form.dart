import 'package:appfood2/db.dart';
import 'package:appfood2/pages/information/activity_result.dart';
import 'package:appfood2/widgets/small_dropdown.dart';
import 'package:appfood2/widgets/wide_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> frequency = ["1", "2", "3", "4", "5", "6", "7"];
List<String> lightActivitiesData = [
  "-----",
  "ดูโทรทัศน์",
  "นอนหลับ",
  "สวดมนต์",
];

class Activity {
  String name;
  int frequency;
  Activity({
    required this.name,
    required this.frequency,
  });
}

class ActivityForm extends StatefulWidget {
  final User user;
  const ActivityForm({
    super.key,
    required this.user,
  });

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
                  child: Column(
                    children: [
                      ActivityFormHeader(
                        username: widget.user.username,
                      ),
                      ActivityFormBody(user: widget.user),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 const MaterialStatePropertyAll(Color(0xFFED7E7E)),
              //             shape:
              //                 MaterialStateProperty.all(RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(30),
              //             ))),
              //         onPressed: () {
              //           setState(() {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => const ActivityResult()));
              //           });
              //         },
              //         child: const Padding(
              //           padding:
              //               EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              //           child: Text(
              //             "ถัดไป",
              //             style: TextStyle(fontSize: 32),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ]),
          );
        }),
      ),
    );
  }
}

class ActivityFormBody extends StatefulWidget {
  final User user;
  const ActivityFormBody({
    super.key,
    required this.user,
  });

  @override
  State<ActivityFormBody> createState() => _ActivityFormBodyState();
}

class _ActivityFormBodyState extends State<ActivityFormBody> {
  final GlobalKey<AnimatedListState> extraLightListKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> lightListKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> mediumListKey =
      GlobalKey<AnimatedListState>();

  List<UserActivity> extraLightActivities = [UserActivity()];
  List<UserActivity> lightActivities = [UserActivity()];
  List<UserActivity> mediumActivities = [UserActivity()];
  List<UserActivity> customActivities = [];

  int tempFrequency = 1;
  final TextEditingController _popupController = TextEditingController();
  final _popupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //changed when widget tree is dirty
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
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text("1. กิจกรรมระดับเบามาก", style: TextStyle(fontSize: 22)),
                  Icon(Icons.question_mark_outlined),
                ],
              ),
            ),
          ),
          AnimatedList(
            key: extraLightListKey,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            initialItemCount: extraLightActivities.length,
            itemBuilder: (BuildContext context, int index, animation) {
              return FadeTransition(
                opacity:
                    CurvedAnimation(parent: animation, curve: Curves.linear),
                child: ActivityDisplay(
                  nameColor: const Color(0xFFFFD7D7),
                  frequencyColor: const Color(0xFFFFEBEB),
                  data: lightActivitiesData,
                  setSelectedName: (String val) {
                    if (val != "-----" &&
                        extraLightActivities.length < 3 &&
                        index == extraLightActivities.length - 1) {
                      setState(() {
                        extraLightActivities.add(UserActivity());
                        extraLightActivities[index].activityName = val;
                        extraLightListKey.currentState!.insertItem(
                          index + 1,
                          duration: const Duration(milliseconds: 1000),
                        );
                      });
                    }
                  },
                  setSelectedFrequency: (String val) {
                    extraLightActivities[index].frequency = int.parse(val);
                  },
                ),
              );
            },
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
          AnimatedList(
            key: lightListKey,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            initialItemCount: lightActivities.length,
            itemBuilder: (BuildContext context, int index, animation) {
              return FadeTransition(
                opacity:
                    CurvedAnimation(parent: animation, curve: Curves.linear),
                child: ActivityDisplay(
                  nameColor: const Color(0xFFFFD7D7),
                  frequencyColor: const Color(0xFFFFEBEB),
                  data: lightActivitiesData,
                  setSelectedName: (String val) {
                    setState(() {
                      if (val != "-----" &&
                          lightActivities.length < 3 &&
                          index == lightActivities.length - 1) {
                        lightActivities.add(UserActivity());
                        lightListKey.currentState!.insertItem(
                          index + 1,
                          duration: const Duration(milliseconds: 1000),
                        );
                      }
                      lightActivities[index].activityName = val;
                    });
                  },
                  setSelectedFrequency: (String val) {
                    lightActivities[index].frequency = int.parse(val);
                  },
                ),
              );
            },
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
          AnimatedList(
            key: mediumListKey,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            initialItemCount: mediumActivities.length,
            itemBuilder: (BuildContext context, int index, animation) {
              return FadeTransition(
                opacity:
                    CurvedAnimation(parent: animation, curve: Curves.linear),
                child: ActivityDisplay(
                  nameColor: const Color(0xFFFFD7D7),
                  frequencyColor: const Color(0xFFFFEBEB),
                  data: lightActivitiesData,
                  setSelectedName: (String val) {
                    setState(() {
                      if (val != "-----" &&
                          mediumActivities.length < 3 &&
                          index == mediumActivities.length - 1) {
                        mediumActivities.add(UserActivity());
                        mediumListKey.currentState!.insertItem(
                          index + 1,
                          duration: const Duration(milliseconds: 1000),
                        );
                      }
                      mediumActivities[index].activityName = val;
                    });
                  },
                  setSelectedFrequency: (String val) {
                    mediumActivities[index].frequency = int.parse(val);
                  },
                ),
              );
            },
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (customActivities.isEmpty) {
                return Container();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 20),
                      child: Text(
                        "กิจกรรมที่บันทึกเพิ่มเติม",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: customActivities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.circle,
                                  color: Color(0xFF636363),
                                  size: 16,
                                ),
                              ),
                              Text(
                                customActivities[index].activityName,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
          Center(
            child: FloatingActionButton.extended(
              icon: const Icon(CupertinoIcons.plus_circle,
                  color: Colors.black, weight: 700),
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
                                borderRadius: BorderRadius.circular(30),
                              ),
                              height: 220,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "กิจกรรมที่ทำ",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 10),
                                    child: Form(
                                      key: _popupFormKey,
                                      child: TextFormField(
                                        controller: _popupController,
                                        keyboardType: TextInputType.text,
                                        style: const TextStyle(fontSize: 18),
                                        validator: (String? val) {
                                          if (val != null && val.trim() == "") {
                                            return "กรุณากรอกกิจกรรมของท่าน";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                            errorStyle: TextStyle(fontSize: 15),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 20),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            helperText: "",
                                            hintText: "พาสุนัขไปเดินเล่น",
                                            hintStyle: TextStyle(
                                                color: Colors.black38)),
                                      ),
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
                                          border:
                                              Border.all(color: Colors.black),
                                          setSelectedItem: (String val) {
                                            setState(() {
                                              // ignore: prefer_typing_uninitialized_variables
                                              tempFrequency = int.parse(val);
                                            });
                                          }),
                                      const Text("ครั้ง/สัปดาห์"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color(0xFF7D90F3)),
                                  ),
                                  onPressed: () {
                                    if (_popupFormKey.currentState != null &&
                                        _popupFormKey.currentState!
                                            .validate()) {
                                      setState(() {
                                        customActivities.add(UserActivity(
                                            activityName: _popupController.text,
                                            frequency: tempFrequency));
                                      });
                                      _popupController.clear();
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 13),
                                    child: Text(
                                      "เพิ่ม",
                                      style: TextStyle(fontSize: 20),
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
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFED7E7E)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {
                    setState(() {
                      widget.user.extraLightActivities = [];
                      widget.user.lightActivities = [];
                      widget.user.mediumActivities = [];
                      for (var element in extraLightActivities) {
                        if (element.activityName != "") {
                          widget.user.extraLightActivities!.add(element);
                        }
                      }
                      for (var element in lightActivities) {
                        if (element.activityName != "") {
                          widget.user.lightActivities!.add(element);
                        }
                      }
                      for (var element in mediumActivities) {
                        if (element.activityName != "") {
                          widget.user.mediumActivities!.add(element);
                        }
                      }
                      widget.user.customActivities = customActivities;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ActivityResult(user: widget.user)));
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: Text(
                      "ถัดไป",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityDisplay extends StatefulWidget {
  final Function(String val) setSelectedName;
  final Function(String val) setSelectedFrequency;
  final Color nameColor;
  final Color frequencyColor;
  final List<String> data;
  const ActivityDisplay({
    super.key,
    required this.setSelectedName,
    required this.setSelectedFrequency,
    required this.data,
    this.nameColor = Colors.white,
    this.frequencyColor = Colors.white,
  });

  @override
  State<ActivityDisplay> createState() => _ActivityDisplayState();
}

class _ActivityDisplayState extends State<ActivityDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: WideDropDown(
                  data: widget.data,
                  border: const BorderSide(color: Colors.black38),
                  color: widget.nameColor,
                  setSelectedItem: widget.setSelectedName,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SmallDropDown(
                data: frequency,
                border: Border.all(color: Colors.black38),
                dropdownColor: widget.frequencyColor,
                buttonColor: widget.frequencyColor,
                setSelectedItem: widget.setSelectedFrequency,
              ),
            ),
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 15),
                child: Text(
                  "ครั้ง/สัปดาห์",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ActivityFormHeader extends StatelessWidget {
  final String username;
  const ActivityFormHeader({
    super.key,
    required this.username,
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
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  "ของคุณ\"$username\"",
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w700),
                ))),
          ],
        ));
  }
}
