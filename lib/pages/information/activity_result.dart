import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<String> activities = <String>[
  "กัดหมา",
  "ปั่นจักรยานละเอียด",
  "จานล้างซันไลต์",
  "คุณยายวิ่งราวฉกกระเป๋า",
  "แอนติไวรัสสอนลงคนอินเดีย",
];

class ActivityResult extends StatelessWidget {
  const ActivityResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("ActivityResult"),
      ),
      body: Center(
        child: Column(
          children: [
            const ActivityResultHeader(),
            ActivityResultBody(),
            const ActivityResultFooter(),
          ],
        ),
      ),
    );
  }
}

class ActivityResultBody extends StatelessWidget {
  final activitiesColor = <Color>[
    const Color(0xFFBAEBC8),
    const Color(0xFFDCFFD9)
  ];

  ActivityResultBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 30),
                    child: Text("กิจกรรมที่ทำ", style: TextStyle(fontSize: 22)),
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemCount: activities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
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
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(activities[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Center(
                child: ResultBar(level: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActivityResultFooter extends StatefulWidget {
  const ActivityResultFooter({super.key});

  @override
  State<ActivityResultFooter> createState() => _ActivityResultFooterState();
}

class ActivityResultHeader extends StatelessWidget {
  const ActivityResultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E807A),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
            child: Text(
              "สรุปกิจกรรมประจำวัน",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class ResultBar extends StatelessWidget {
  final int level;
  const ResultBar({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
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
            const SmileFace(),
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

class _ActivityResultFooterState extends State<ActivityResultFooter> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text("กิจกรรมของคุณแจ่มใส",
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text("อยู่ในระดับ",
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF9FFB5),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text("กิจกรรมระดับปานกลาง",
                    style: TextStyle(fontSize: 20)),
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
                  const Text(
                    "ต้องการให้ระบบบันทึกกิจกรรมสำหรับวันถัดไป",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                "เพื่อคำนวณค่าพลังงานความต้องการเบิ้องต้นหรือไม่",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFF7ECCED)),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                onPressed: () {},
                child: const Text(
                  "บันทึก",
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
