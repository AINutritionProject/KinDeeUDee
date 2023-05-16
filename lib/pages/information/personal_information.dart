import 'package:flutter/material.dart';
import 'package:appfood2/pages/home.dart';
import 'package:appfood2/widgets/dropdown.dart';
import 'package:appfood2/db.dart';

List<String> careers = <String>[
  "------------",
  "รับข้าราชการ",
  "ข้าราชการบำนาญ",
  "เกษตรกร",
  "ธุรกิจส่วนตัว",
  "นักข่าว",
  "จิตกร",
  "ศิลปิน"
];

List<String> chronicDiseases = <String>[
  "-------------",
  "โรคเบาหวาน",
  "โรคความดัยโลหิตสูง",
  "โรคหัวใจ",
  "โรคโลหิตจาง",
  "โรคไต",
  "โรคภูมิแพ้",
  "โรคหอบหืด",
  "โรคอ้วน",
];

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: const IntrinsicHeight(
            child: Column(
              children: [
                PersonalHeader(),
                PersonalBody(),
              ],
            ),
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
  final TextEditingController _foodAllergyTextController =
      TextEditingController();
  late String name;
  late String gender;
  late int age;
  late double weight;
  late double height;
  late String foodAllergy;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _genderTextController.dispose();
    _ageTextController.dispose();
    _weightTextController.dispose();
    _heightTextController.dispose();
    _foodAllergyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
            WideDropDown(data: careers, title: "อาชีพ"),
            WideDropDown(data: chronicDiseases, title: "โรคประจำตัว"),
            OneChildTextField(
                textController: _foodAllergyTextController,
                textName: "ประวัติการแพ้อาหาร",
                textHint: "แพ้กุ้ง,แพ้ปู,แพ้ปลา,แพ้หมู,แพ้แมว"),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFED7E7E)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {
                    setState(() {
                      name = _nameTextController.text;
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
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class TwoChildTextField extends StatefulWidget {
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
  State<TwoChildTextField> createState() => _TwoChildTextFieldState();
}

class _TwoChildTextFieldState extends State<TwoChildTextField> {
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
                    widget.leftTextName,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: TextField(
                    controller: widget.leftTextController,
                    keyboardType: widget.leftTextInputType,
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
                      hintText: widget.leftTextHint,
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
                    widget.rightTextName,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: TextField(
                    controller: widget.rightTextController,
                    keyboardType: widget.rightTextInputType,
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
                      hintText: widget.rightTextHint,
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

class OneChildTextField extends StatefulWidget {
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
  State<OneChildTextField> createState() => _OneChildTextFieldState();
}

class _OneChildTextFieldState extends State<OneChildTextField> {
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
              widget.textName,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          TextField(
            keyboardType: widget.textInputType,
            controller: widget.textController,
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
              hintText: widget.textHint,
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
  });

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
                    child: FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            "\"${snapshot.data!.username}\"",
                            style: const TextStyle(fontSize: 24),
                          );
                        } else {
                          return const Text("");
                        }
                      },
                      future: getUser(),
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
