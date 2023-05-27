import 'package:flutter/material.dart';

List<String> activities = <String>[
  "กัดหมา",
  "จักรยานปั่นละเอียด",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const ActivityResultHeader(),
              ActivityResultBody(),
              const ActivityResultFooter(),
            ],
          ),
        ),
      ),
    );
  }
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

class ActivityResultBody extends StatelessWidget {
  ActivityResultBody({super.key});

  final activitiesColor = <Color>[
    const Color(0xFFBAEBC8),
    const Color(0xFFDCFFD9)
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                    height: 200,
                    child: ListView.builder(
                      itemCount: activities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Color(0xFF636363),
                                size: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    color: activitiesColor[index % 2],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(activities[index],
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
                child: Text("Status bar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActivityResultFooter extends StatelessWidget {
  const ActivityResultFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 3,
      child: Center(
        child: Text("Footer"),
      ),
    );
  }
}
