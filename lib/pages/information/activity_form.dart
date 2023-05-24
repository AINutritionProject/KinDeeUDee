import 'package:flutter/material.dart';
import 'package:appfood2/widgets/wide_dropdown.dart';

List<String> lightActivty = ["ดูโทรทัศน์", "นอนหลับ", "สวดมนต์"];

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

class _ActivityFormBodyState extends State<ActivityFormBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("1. กิจกรรมระดับเบามาก",
                        style: TextStyle(fontSize: 22)),
                    Icon(Icons.question_mark_outlined),
                  ],
                ),
              ),
              WideDropDown(
                data: lightActivty,
                color: const Color(0xFFFFD7D7),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("2. กิจกรรมระดับเบา", style: TextStyle(fontSize: 22)),
                    Icon(Icons.question_mark_outlined),
                  ],
                ),
              ),
              WideDropDown(
                data: lightActivty,
                color: const Color(0xFFFFD7D7),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("3. กิจกรรมระดับปานกลาง",
                        style: TextStyle(fontSize: 22)),
                    Icon(Icons.question_mark_outlined),
                  ],
                ),
              ),
              WideDropDown(
                data: lightActivty,
                color: const Color(0xFFFFD7D7),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ActivityFormHeader extends StatelessWidget {
  const ActivityFormHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 200,
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
          )),
    );
  }
}
