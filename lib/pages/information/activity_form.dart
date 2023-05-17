import 'package:flutter/material.dart';

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
                Header(),
                Body(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Text("Body");
  }
}

class Header extends StatelessWidget {
  const Header({
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
