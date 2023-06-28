import 'package:appfood2/db.dart';
import 'package:appfood2/pages/information/activity_result.dart';
import 'package:appfood2/widgets/small_dropdown.dart';
import 'package:appfood2/widgets/wide_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/screen_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<String> frequency = ["1", "2", "3", "4", "5", "6", "7"];
List<String> lightActivitiesData = [
  "-----",
  "ดูโทรทัศน์",
  "นอนหลับ",
  "สวดมนต์",
];

class ActivityForm extends StatefulWidget {
  final User user;
  final bool
      isConfig; //this variable is use to determine if to write to db when finish result
  const ActivityForm({
    super.key,
    required this.user,
    this.isConfig = false,
  });

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: screenSizeData.screenWidth <= screenSizeData.maxWidth
            ? Colors.white
            : Colors.black,
        child: Center(
            child: Container(
          width: screenSizeData.screenSizeWidth,
          color: const Color.fromRGBO(255, 251, 242, 1),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        children: [
                          ActivityFormHeader(
                            username: widget.user.username,
                          ),
                          ActivityFormBody(
                              user: widget.user, isConfig: widget.isConfig),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        )),
      )),
    );
  }
}

class ActivityFormBody extends StatefulWidget {
  final User user;
  final bool isConfig;
  const ActivityFormBody({
    super.key,
    required this.user,
    this.isConfig = false,
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

  final TextEditingController _popupController = TextEditingController();
  final _popupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.user.extraLightActivities != null) {
      extraLightActivities = widget.user.extraLightActivities!;
      if (extraLightActivities.length < 3) {
        extraLightActivities.add(UserActivity());
      }
    }
    if (widget.user.lightActivities != null) {
      lightActivities = widget.user.lightActivities!;
      if (lightActivities.length < 3) {
        lightActivities.add(UserActivity());
      }
    }
    if (widget.user.mediumActivities != null) {
      mediumActivities = widget.user.mediumActivities!;
      if (mediumActivities.length < 3) {
        mediumActivities.add(UserActivity());
      }
    }
    if (widget.user.customActivities != null) {
      customActivities = widget.user.customActivities!;
    }
    super.initState();
  }

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
              return SizeTransition(
                sizeFactor: animation,
                child: ActivityDisplay(
                  nameColor: const Color(0xFFFFD7D7),
                  frequencyColor: const Color(0xFFFFEBEB),
                  data: lightActivitiesData,
                  initialSelectedName:
                      extraLightActivities[index].activityName == ""
                          ? null
                          : extraLightActivities[index].activityName,
                  initialSelectedFrequency:
                      extraLightActivities[index].frequency,
                  setSelectedName: (String val) {
                    setState(() {
                      val != "-----"
                          ? extraLightActivities[index].activityName = val
                          : extraLightActivities[index].activityName = "";
                      if (val == "-----" &&
                          index < extraLightActivities.length - 1) {
                        final tempActiviyName =
                            extraLightActivities[index].activityName;
                        final tempActiviyFrequency =
                            extraLightActivities[index].frequency;
                        extraLightListKey.currentState!.removeItem(
                          index,
                          (context, animation) => SizeTransition(
                            sizeFactor: animation,
                            child: ActivityDisplay(
                              nameColor: const Color(0xFFFFD7D7),
                              frequencyColor: const Color(0xFFFFEBEB),
                              data: lightActivitiesData,
                              initialSelectedName: tempActiviyName,
                              initialSelectedFrequency: tempActiviyFrequency,
                              setSelectedFrequency: (val) {},
                              setSelectedName: (val) {},
                            ),
                          ),
                          duration: const Duration(milliseconds: 300),
                        );
                        extraLightActivities.removeAt(index);
                      }
                      if (extraLightActivities.last.activityName != "" &&
                          extraLightActivities.length < 3) {
                        extraLightActivities.add(UserActivity());
                        extraLightListKey.currentState!.insertItem(
                          index + 1,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
                    });
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
              return SizeTransition(
                sizeFactor: animation,
                child: ActivityDisplay(
                  nameColor: const Color(0xFFFFD7D7),
                  frequencyColor: const Color(0xFFFFEBEB),
                  data: lightActivitiesData,
                  initialSelectedName: lightActivities[index].activityName == ""
                      ? null
                      : lightActivities[index].activityName,
                  initialSelectedFrequency: lightActivities[index].frequency,
                  setSelectedName: (String val) {
                    setState(() {
                      val != "-----"
                          ? lightActivities[index].activityName = val
                          : lightActivities[index].activityName = "";
                      if (val == "-----" &&
                          index < lightActivities.length - 1) {
                        final tempActiviyName =
                            lightActivities[index].activityName;
                        final tempActiviyFrequency =
                            lightActivities[index].frequency;
                        lightListKey.currentState!.removeItem(
                          index,
                          (context, animation) => SizeTransition(
                            sizeFactor: animation,
                            child: ActivityDisplay(
                              nameColor: const Color(0xFFFFD7D7),
                              frequencyColor: const Color(0xFFFFEBEB),
                              data: lightActivitiesData,
                              initialSelectedName: tempActiviyName,
                              initialSelectedFrequency: tempActiviyFrequency,
                              setSelectedFrequency: (val) {},
                              setSelectedName: (val) {},
                            ),
                          ),
                          duration: const Duration(milliseconds: 300),
                        );
                        lightActivities.removeAt(index);
                      }
                      if (lightActivities.last.activityName != "" &&
                          lightActivities.length < 3) {
                        lightActivities.add(UserActivity());
                        lightListKey.currentState!.insertItem(
                          index + 1,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
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
              return SizeTransition(
                sizeFactor: animation,
                child: ActivityDisplay(
                  nameColor: const Color(0xFFFFD7D7),
                  frequencyColor: const Color(0xFFFFEBEB),
                  data: lightActivitiesData,
                  initialSelectedName:
                      mediumActivities[index].activityName == ""
                          ? null
                          : mediumActivities[index].activityName,
                  initialSelectedFrequency: mediumActivities[index].frequency,
                  setSelectedName: (String val) {
                    setState(() {
                      val != "-----"
                          ? mediumActivities[index].activityName = val
                          : mediumActivities[index].activityName = "";
                      if (val == "-----" &&
                          index < mediumActivities.length - 1) {
                        final tempActiviyName =
                            mediumActivities[index].activityName;
                        final tempActiviyFrequency =
                            mediumActivities[index].frequency;
                        mediumListKey.currentState!.removeItem(
                          index,
                          (context, animation) => SizeTransition(
                            sizeFactor: animation,
                            child: ActivityDisplay(
                              nameColor: const Color(0xFFFFD7D7),
                              frequencyColor: const Color(0xFFFFEBEB),
                              data: lightActivitiesData,
                              initialSelectedName: tempActiviyName,
                              initialSelectedFrequency: tempActiviyFrequency,
                              setSelectedFrequency: (val) {},
                              setSelectedName: (val) {},
                            ),
                          ),
                          duration: const Duration(milliseconds: 300),
                        );
                        mediumActivities.removeAt(index);
                      }
                      if (mediumActivities.last.activityName != "" &&
                          mediumActivities.length < 3) {
                        mediumActivities.add(UserActivity());
                        mediumListKey.currentState!.insertItem(
                          index + 1,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
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
                            fontSize: 21, fontWeight: FontWeight.bold),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
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
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    customActivities.removeAt(index);
                                  });
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.circleXmark,
                                  color: Colors.red,
                                ),
                              )
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
                              height: 180,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "กิจกรรมที่ทำ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
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
                                            frequency: 0));
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
                        builder: (context) => ActivityResult(
                            user: widget.user, isConfig: widget.isConfig)));
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
  final String? initialSelectedName;
  final int? initialSelectedFrequency;
  final Color nameColor;
  final Color frequencyColor;
  final List<String> data;
  const ActivityDisplay({
    super.key,
    required this.setSelectedName,
    required this.setSelectedFrequency,
    required this.data,
    this.initialSelectedFrequency,
    this.initialSelectedName,
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
                  key: ValueKey(widget.initialSelectedName),
                  data: widget.data,
                  border: const BorderSide(color: Colors.black38),
                  color: widget.nameColor,
                  initialValue: widget.initialSelectedName,
                  setSelectedItem: widget.setSelectedName,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SmallDropDown(
                key: ValueKey(widget.initialSelectedFrequency),
                data: frequency,
                border: Border.all(color: Colors.black38),
                dropdownColor: widget.frequencyColor,
                buttonColor: widget.frequencyColor,
                initialValue: widget.initialSelectedFrequency,
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
