import 'package:flutter/material.dart';
import 'package:appfood2/pages/home.dart';
import 'package:flutter/services.dart';

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
  final TextEditingController _genderTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  final TextEditingController _weightTextController = TextEditingController();
  final TextEditingController _heightTextController = TextEditingController();
  late String name;
  late String gender;
  late int age;
  late double weight;
  late double height;

  @override
  void initState() {
    super.initState();
    name = "";
    gender = "";
    age = -1;
    weight = -1;
    height = -1;
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _genderTextController.dispose();
    _ageTextController.dispose();
    _weightTextController.dispose();
    _heightTextController.dispose();
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
            TwoChildTextField(
              leftTextController: _genderTextController,
              leftTextName: "เพศ",
              rightTextController: _ageTextController,
              rightTextName: "อายุ",
              rightTextInputType: TextInputType.number,
            ),
            TwoChildTextField(
              leftTextController: _weightTextController,
              rightTextController: _heightTextController,
              leftTextName: "น้ำหนัก",
              rightTextName: "ส่วนสูง",
              leftTextInputType: TextInputType.number,
              rightTextInputType: TextInputType.number,
            ),
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

class TwoChildTextField extends StatelessWidget {
  final TextEditingController rightTextController;
  final TextEditingController leftTextController;
  final String leftTextName;
  final String rightTextName;
  final String leftTextHint;
  final String rightTextHint;
  final TextInputType leftTextInputType;
  final TextInputType rightTextInputType;
  const TwoChildTextField({
    super.key,
    required this.leftTextController,
    required this.rightTextController,
    required this.leftTextName,
    required this.rightTextName,
    this.leftTextHint = "",
    this.rightTextHint = "",
    this.leftTextInputType = TextInputType.text,
    this.rightTextInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                    leftTextName,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: TextField(
                    controller: leftTextController,
                    keyboardType: leftTextInputType,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: leftTextHint,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                    rightTextName,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: TextField(
                    controller: rightTextController,
                    keyboardType: rightTextInputType,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: rightTextHint,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OneChildTextField extends StatelessWidget {
  final TextEditingController textController;
  final String textName;
  final String textHint;
  final TextInputType textInputType;
  const OneChildTextField({
    super.key,
    required this.textController,
    required this.textName,
    this.textInputType = TextInputType.text,
    this.textHint = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              textName,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          TextField(
            keyboardType: textInputType,
            controller: textController,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: textHint,
            ),
          ),
        ],
      ),
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
