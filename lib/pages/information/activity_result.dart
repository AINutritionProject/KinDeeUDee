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
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              ActivityResultHeader(),
              ActivityResultBody(),
              ActivityResultFooter(),
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
  const ActivityResultBody({super.key});

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
                  const Text("กิจกรรมที่ทำ"),
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return const Text("activity");
                    },
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
