import 'package:flutter/material.dart';
import 'package:appfood2/pages/home.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Column(
            children: [
              PersonalHeader(),
              PersonalBody(),
            ],
          ),
        ),
      );
    });
  }
}

class PersonalBody extends StatefulWidget {
  const PersonalBody({
    super.key,
  });
  @override
  State<PersonalBody> createState() => _PersonalBodyState();
}

class _PersonalBodyState extends State<PersonalBody> {
  final TextEditingController _nameTextController = TextEditingController();
  late String name;

  @override
  void initState() {
    super.initState();
    name = "";
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FFDD),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            OneChildTextField(
                textController: _nameTextController,
                textName: "ชื่อ-นามสกุล",
                textHint: "ฟ้าใส ใจดี"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = _nameTextController.text;
                });
              },
              child: const Text("Submit"),
            ),
          ]),
        ),
      ),
    );
  }
}

class OneChildTextField extends StatelessWidget {
  final TextEditingController textController;
  final String textName;
  final String textHint;

  const OneChildTextField({
    super.key,
    required this.textController,
    required this.textName,
    this.textHint = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: Text(textName),
        ),
        TextField(
          controller: textController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: textHint,
          ),
        ),
      ],
    );
  }
}

class PersonalHeader extends StatefulWidget {
  const PersonalHeader({
    super.key,
    this.username = "PAFF",
  });

  final String username;

  @override
  State<PersonalHeader> createState() => _PersonalHeaderState();
}

class _PersonalHeaderState extends State<PersonalHeader> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserAvatar(),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text("ยินดีต้อนรับ",
                        style: TextStyle(
                          fontSize: 32,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8.0),
                    child: Text(
                      "\"${widget.username}\"",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF99F9B4),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      alignment: Alignment.center,
                      child: const Text("ข้อมูลส่วนตัว",
                          style: TextStyle(
                            fontSize: 24,
                          )),
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
