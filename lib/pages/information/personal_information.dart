import 'package:flutter/material.dart';
import 'package:appfood2/pages/home.dart';
import 'package:appfood2/widgets/wide_dropdown.dart';
import 'package:appfood2/db.dart';
import 'package:appfood2/pages/information/activity_form.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/widgets/button_back.dart';

List<String> careers = <String>[
  "-----",
  "รับข้าราชการ",
  "ข้าราชการบำนาญ",
  "เกษตรกร",
  "ธุรกิจส่วนตัว",
  "นักข่าว",
  "จิตกร",
  "ศิลปิน"
];

List<String> chronicDiseases = <String>[
  "-----",
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
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: Container(
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: Container(
              color: const Color(0xFFF8FFDD),
              width: screenSizeData.screenSizeWidth,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    PersonalHeader(user: user),
                    PersonalBody(user: user),
                  ],
                ),
              ),
            ),
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
  late String selectedCareer;
  late String selectedChronicDisease;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameTextController.text = widget.user.fullname;
    _genderTextController.text = widget.user.gender;
    _ageTextController.text =
        widget.user.age == 0 ? "" : widget.user.age.toString();
    _weightTextController.text =
        widget.user.weight == 0 ? "" : widget.user.weight.toString();
    _heightTextController.text =
        widget.user.height == 0 ? "" : widget.user.height.toString();
    _foodAllergyTextController.text = widget.user.foodAllergy;
    selectedCareer = widget.user.career;
    selectedChronicDisease = widget.user.chronicDisease;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("ชื่อ - นามสกุล",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nameTextController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: nameValidate,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      errorStyle:
                          const TextStyle(fontSize: 15, color: Colors.red),
                      errorMaxLines: 2,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "ยิ้มแย้ม แจ่มใส",
                      helperText: "\n",
                      helperStyle:
                          const TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("เพศ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            width: 130, //temporary
                            child: TextFormField(
                              validator: genderValidate,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _genderTextController,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                                errorMaxLines: 2,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "ชาย/หญิง",
                                helperText: "\n",
                                helperStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("อายุ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            width: 130,
                            child: TextFormField(
                              validator: ageValidate,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _ageTextController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                                errorMaxLines: 2,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "ปี",
                                helperText: "\n",
                                helperStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("น้ำหนัก",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            width: 130, //temporary
                            child: TextFormField(
                              validator: weightValidate,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _weightTextController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                                errorMaxLines: 2,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "กิโลกรัม",
                                helperText: "\n",
                                helperStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("ส่วนสูง",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            width: 130,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: heightValdiate,
                              controller: _heightTextController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                                errorMaxLines: 2,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "เซนติเมตร",
                                helperText: "\n",
                                helperStyle: const TextStyle(
                                    fontSize: 15, color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: WideDropDown(
                        data: careers,
                        title: "อาชีพ",
                        border: const BorderSide(color: Colors.black38),
                        initialValue:
                            selectedCareer == "" ? "-----" : selectedCareer,
                        setSelectedItem: (String val) {
                          setState(() {
                            selectedCareer = val;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: WideDropDown(
                        data: chronicDiseases,
                        title: "โรคประจำตัว",
                        border: const BorderSide(color: Colors.black38),
                        initialValue: selectedChronicDisease == ""
                            ? "-----"
                            : selectedChronicDisease,
                        setSelectedItem: (String val) {
                          setState(() {
                            selectedChronicDisease = val;
                          });
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "ประวัติการแพ้อาหาร",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _foodAllergyTextController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: foodAllergyValidate,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      errorStyle:
                          const TextStyle(fontSize: 15, color: Colors.red),
                      errorMaxLines: 2,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "แพ้อาหารทะเล,แพ้ถั่ว",
                      helperText: "\n",
                      helperStyle:
                          const TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                margin: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFED7E7E)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      setState(() {
                        widget.user.fullname = _nameTextController.text;
                        widget.user.gender = _genderTextController.text;
                        widget.user.age = int.parse(_ageTextController.text);
                        widget.user.weight =
                            double.parse(_weightTextController.text);
                        widget.user.height =
                            double.parse(_heightTextController.text);
                        widget.user.career =
                            selectedCareer == "-----" ? "" : selectedCareer;
                        widget.user.chronicDisease =
                            selectedChronicDisease == "-----"
                                ? ""
                                : selectedChronicDisease;
                        widget.user.foodAllergy =
                            _foodAllergyTextController.text;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ActivityForm(user: widget.user)));
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: Text(
                      "ถัดไป",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Stack(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: ButtonBack(
                      colorCircle: Color(0xFFF8FFDD),
                    )),
                Center(child: UserAvatar()),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: const Text("ยินดีต้อนรับ",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600)),
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        child: Text(
                          "\"${widget.user.username}\"",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Container(
                        width: 185,
                        height: 59,
                        decoration: const BoxDecoration(
                          color: Color(0xFF99F9B4),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        alignment: Alignment.center,
                        child: const Text("ข้อมูลส่วนตัว",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? nameValidate(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกชื่อและนามสกุลของท่าน";
    }
    if (!text.contains(" ")) {
      return "กรุณากรอกข้อมูลด้วยรูปแบบ \"ชื่อ นามสกุล\"";
    }
    if (text.split(" ")[0].contains(RegExp('[^a-zA-Z\u0E00-\u0E7F]')) ||
        text.split(" ")[1].contains(RegExp('[^a-zA-Z\u0E00-\u0E7F]'))) {
      return "ชื่อ-นามสกุลที่ท่านกรอกต้องไม่มีตัวเลข และตัวอักษรพิเศษ";
    }
  }
  return null;
}

String? genderValidate(String? val) {
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
}

String? ageValidate(String? val) {
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
}

String? weightValidate(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกน้ำหนักของท่าน";
    }
    if (text.contains(RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$'))) {
      return null;
    } else {
      return "กรุณากรอกตัวเลขทศนิยมหรือจำนวนเต็ม";
    }
  }
  return null;
}

String? heightValdiate(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกส่วนสูงของท่าน";
    }
    if (text.contains(RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$'))) {
      return null;
    } else {
      return "กรุณากรอกตัวเลขทศนิยมหรือจำนวนเต็ม";
    }
  }
  return null;
}

String? foodAllergyValidate(String? val) {
  return null;
}
