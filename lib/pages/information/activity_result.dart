import 'package:appfood2/pages/information/save_data_success.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/db.dart';
import 'package:appfood2/pages/information/milk.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/widgets/button_back.dart';

class ActivityResult extends StatelessWidget {
  final User user;
  final bool isConfig;
  const ActivityResult({
    super.key,
    required this.user,
    this.isConfig = false,
  });
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
              height: screenSizeData.screenHeight,
              color: const Color.fromRGBO(255, 251, 242, 1),
              child: Center(
                child: Column(
                  children: [
                    ActivityResultHeader(
                      width: screenSizeData.screenSizeWidth,
                      height: screenSizeData.screenHeight,
                    ),
                    ActivityResultBody(user: user),
                    ActivityResultFooter(user: user, isConfig: isConfig),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityResultBody extends StatefulWidget {
  final User user;

  const ActivityResultBody({
    super.key,
    required this.user,
  });

  @override
  State<ActivityResultBody> createState() => _ActivityResultBodyState();
}

class _ActivityResultBodyState extends State<ActivityResultBody> {
  final activitiesColor = <Color>[
    const Color(0xFFBAEBC8),
    const Color(0xFFDCFFD9)
  ];
  List<String> activities = [];
  int activityLevel = 1;

  @override
  void initState() {
    for (var element in widget.user.extraLightActivities!) {
      if (element.activityName != "") {
        activities.add(element.activityName);
        activityLevel = 1;
      }
    }
    for (var element in widget.user.lightActivities!) {
      if (element.activityName != "") {
        activities.add(element.activityName);
        activityLevel = 2;
      }
    }
    for (var element in widget.user.mediumActivities!) {
      if (element.activityName != "") {
        activities.add(element.activityName);
        activityLevel = 3;
      }
    }
    for (var element in widget.user.customActivities!) {
      activities.add(element.activityName);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width < 600 ? 8 : 25,
                        bottom: 20),
                    child: Text("กิจกรรมที่ทำ",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width < 600
                                ? 22
                                : 28,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width < 600 ? 8 : 25),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width < 550
                          ? MediaQuery.of(context).size.height * 0.26
                          : MediaQuery.of(context).size.height * 0.35,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: activities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: Color(0xFF636363),
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 9),
                                    decoration: BoxDecoration(
                                        color: activitiesColor[index % 2],
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Text(activities[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  600
                                              ? 20
                                              : 28,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Builder(builder: (context) {
                  return ResultBar(level: activityLevel);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActivityResultHeader extends StatelessWidget {
  const ActivityResultHeader(
      {super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ButtonBack(
                  color: Colors.white,
                  colorCircle: Colors.orange,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              decoration: BoxDecoration(
                color: const Color(0xFF1E807A),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "สรุปกิจกรรมประจำวัน",
                style: TextStyle(
                    fontSize: width < 600 ? 22 : 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                //textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultBar extends StatelessWidget {
  final int level; // 1, 2, 3
  const ResultBar({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: constraints.maxHeight,
              width: 23,
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xAFFF3434),
                    Color(0xAFEEF07C),
                    Color(0xAF8FFBAD),
                  ],
                ),
              ),
            ),
            level == 2
                ? const SmileFace()
                : level == 1
                    ? Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.05,
                        child: const SmileFace(),
                      )
                    : Positioned(
                        top: MediaQuery.of(context).size.height * 0.05,
                        child: const SmileFace(),
                      ),
          ],
        );
      },
    );
  }
}

class SmileFace extends StatelessWidget {
  const SmileFace({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const FaIcon(
            FontAwesomeIcons.faceSmile,
            color: Colors.black,
            size: 50,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFFD703), width: 5),
            shape: BoxShape.circle,
          ),
          width: 50,
          height: 50,
        )
      ],
    );
  }
}

class ActivityResultFooter extends StatefulWidget {
  final User user;
  final bool isConfig;
  const ActivityResultFooter({
    super.key,
    required this.user,
    this.isConfig = false,
  });

  @override
  State<ActivityResultFooter> createState() => _ActivityResultFooterState();
}

class _ActivityResultFooterState extends State<ActivityResultFooter> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final double sizeText = MediaQuery.of(context).size.width < 600 ? 16 : 20;
    final double sizeTextButton =
        MediaQuery.of(context).size.width < 600 ? 24 : 32;
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: [
            Text(
              "กิจกรรมของคุณ \"${widget.user.username}\"",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 24),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "อยู่ในระดับ",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 24),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF9FFB5),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("กิจกรรมระดับปานกลาง",
                    style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width < 600 ? 20 : 24,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Checkbox(
                        overlayColor:
                            const MaterialStatePropertyAll(Color(0xFFC6FF9A)),
                        value: isChecked,
                        activeColor: const Color(0xFFBAEBC8),
                        onChanged: (bool? val) {
                          setState(() {
                            isChecked = val!;
                          });
                        }),
                  ),
                  Text(
                    "ต้องการให้ระบบบันทึกกิจกรรมสำหรับวันถัดไป",
                    style: TextStyle(
                        fontSize: sizeText, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                "เพื่อคำนวณค่าพลังงานความต้องการเบิ้องต้นหรือไม่",
                style:
                    TextStyle(fontSize: sizeText, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 23.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFF7ECCED)),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                onPressed: () {
                  setState(() {
                    for (var element in widget.user.extraLightActivities!) {
                      if (element.activityName != "") {
                        widget.user.activityLevel = 1;
                      }
                    }
                    for (var element in widget.user.lightActivities!) {
                      if (element.activityName != "") {
                        widget.user.activityLevel = 2;
                      }
                    }
                    for (var element in widget.user.mediumActivities!) {
                      if (element.activityName != "") {
                        widget.user.activityLevel = 3;
                      }
                    }
                    widget.user.activityInputTime =
                        DateTime.now().millisecondsSinceEpoch;
                    if (isChecked) {
                      widget.user.saveActivity = true;
                    } else {
                      widget.user.saveActivity = false;
                    }
                    if (!widget.isConfig) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MilkPage(user: widget.user)));
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => SaveDataSuccessPage(
                                    user: widget.user,
                                    isConfig: true,
                                  )),
                          (route) => route.isFirst);
                    }
                  });
                },
                child: Text(
                  "บันทึก",
                  style: TextStyle(
                      fontSize: sizeTextButton, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
