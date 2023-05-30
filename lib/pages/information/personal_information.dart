import 'package:flutter/material.dart';
import 'package:appfood2/pages/home.dart';
import 'package:appfood2/widgets/wide_dropdown.dart';
import 'package:appfood2/db.dart';
import 'package:appfood2/pages/information/activity_form.dart';

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
  "โรคความดันโลหิตสูง",
  "โรคหัวใจ",
  "โรคโลหิตจาง",
  "โรคไต",
  "โรคภูมิแพ้",
  "โรคหอบหืด",
  "โรคอ้วน",
];

class PersonalInformation extends StatelessWidget {
  final User user;
  const PersonalInformation({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            children: [
              PersonalHeader(user: user),
              PersonalBody(user: user),
            ],
          ),
        ),
      );
    });
  }
}

class PersonalBody extends StatefulWidget {
  final User user;
  const PersonalBody({
    super.key,
    required this.user,
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
  String selectedCareer = "";
  String selectedChronicDisease = "";

  bool validatedName = false;
  bool validatedGender = false;
  bool validatedAge = false;
  bool validatedWeight = false;
  bool validatedHeight = false;
  bool validatedCareer = false;
  bool validatedChronicDisease = false;
  bool validatedFoodAllergyText = false;

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
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FFDD),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          OneChildTextField(
              textController: _nameTextController,
              errorText: (String? val) {
                if (val != null) {
                  String text = val.trim();
                  if (text.isEmpty) {
                    return "กรุณากรอกชื่อและนามสกุลของท่าน";
                  }
                  if (!text.contains(" ")) {
                    return "กรุณากรอกข้อมูลด้วยรูปแบบ\nชื่อ นามสกุล";
                  }
                  if (text
                          .split(" ")[0]
                          .contains(RegExp('[^a-zA-Z\u0E00-\u0E7F]')) ||
                      text
                          .split(" ")[1]
                          .contains(RegExp('[^a-zA-Z\u0E00-\u0E7F]'))) {
                    return "ชื่อ-นามสกุลที่ท่านกรอกต้องไม่มีตัวเลข และตัวอักษรพิเศษ";
                  }
                }
                return null;
              },
              textName: "ชื่อ-นามสกุล",
              textHint: "ฟ้าใส ใจดี"),
          TwoChildTextField(
            errorLeftText: (String? val) {
              if (val != null) {
                String text = val.trim();
                if (text.isEmpty) {
                  return "กรุณากรอกเพศของท่าน";
                }
                if (text != "ชาย" && text != "หญิง") {
                  return "กรุณากรอกเพศ ชาย/หญิง";
                }
              }
              return null;
            },
            errorRightText: (String? val) {
              if (val != null) {
                String text = val.trim();
                if (text.isEmpty) {
                  return "กรุณากรอกอายุของท่าน";
                }
                if (text.contains(RegExp(r'\D'))) {
                  return "กรุณากรอกเพียงตัวเลขจำนวนเต็ม";
                }
              }
              return null;
            },
            leftTextController: _genderTextController,
            leftTextName: "เพศ",
            rightTextController: _ageTextController,
            rightTextName: "อายุ",
            rightTextInputType: TextInputType.number,
          ),
          TwoChildTextField(
            leftTextController: _weightTextController,
            rightTextController: _heightTextController,
            errorLeftText: (String? val) {
              if (val != null) {
                String text = val.trim();
                if (text.isEmpty) {
                  return "กรุณากรอกน้ำหนักของท่าน";
                }
                if (text.contains(
                    RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$'))) {
                  return null;
                } else {
                  return "กรุณากรอกตัวเลขทศนิยมหรือจำนวนเต็ม";
                }
              }
              return null;
            },
            errorRightText: (String? val) {
              if (val != null) {
                String text = val.trim();
                if (text.isEmpty) {
                  return "กรุณากรอกส่วนสูงของท่าน";
                }
                if (text.contains(
                    RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$'))) {
                  return null;
                } else {
                  return "กรุณากรอกตัวเลขทศนิยมหรือจำนวนเต็ม";
                }
              }
              return null;
            },
            leftTextName: "น้ำหนัก",
            rightTextName: "ส่วนสูง",
            leftTextInputType: TextInputType.number,
            rightTextInputType: TextInputType.number,
          ),
          WideDropDown(
              data: careers,
              title: "อาชีพ",
              setSelectedItem: (String val) {
                setState(() {
                  selectedCareer = val;
                });
              }),
          WideDropDown(
            data: chronicDiseases,
            title: "โรคประจำตัว",
            setSelectedItem: (String val) {
              setState(() {
                selectedChronicDisease = val;
              });
            },
          ),
          OneChildTextField(
              textController: _foodAllergyTextController,
              errorText: (String? val) {
                return null;
              },
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
                    widget.user.fullname = _nameTextController.text;
                    widget.user.gender = _genderTextController.text;
                    widget.user.age = int.parse(_ageTextController.text);
                    widget.user.weight =
                        double.parse(_weightTextController.text);
                    widget.user.height =
                        double.parse(_heightTextController.text);
                    widget.user.foodAllergy = _foodAllergyTextController.text;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ActivityForm()));
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
  final String? Function(String?) errorLeftText;
  final String? Function(String?) errorRightText;
  const TwoChildTextField({
    super.key,
    required this.leftTextController,
    required this.rightTextController,
    required this.leftTextName,
    required this.rightTextName,
    required this.errorLeftText,
    required this.errorRightText,
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
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: widget.errorLeftText,
                    controller: widget.leftTextController,
                    keyboardType: widget.leftTextInputType,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      errorStyle:
                          const TextStyle(fontSize: 15, color: Colors.red),
                      errorMaxLines: 2,
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
          // Expanded(
          //   flex: 1,
          //   child: Container(),
          // ),
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
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: widget.errorRightText,
                    controller: widget.rightTextController,
                    keyboardType: widget.rightTextInputType,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      errorStyle:
                          const TextStyle(fontSize: 15, color: Colors.red),
                      errorMaxLines: 2,
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
  final String? Function(String?) errorText;
  const OneChildTextField({
    super.key,
    required this.textController,
    required this.errorText,
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
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: widget.textInputType,
            controller: widget.textController,
            style: const TextStyle(fontSize: 18),
            validator: widget.errorText,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 15, color: Colors.red),
              errorMaxLines: 2,
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
  final User user;
  const PersonalHeader({
    super.key,
    required this.user,
  });

  @override
  State<PersonalHeader> createState() => _PersonalHeaderState();
}

class _PersonalHeaderState extends State<PersonalHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
                        "\"${widget.user.username}\"",
                        style: const TextStyle(fontSize: 24),
                      )),
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
