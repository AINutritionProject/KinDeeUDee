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

  final formKey = GlobalKey<FormState>();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("ชื่อนามสกุล", style: TextStyle(fontSize: 20)),
                  TextFormField(),
                ],
              ),
            ),
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                margin: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFED7E7E)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                  onPressed: () {
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate()) {
                      setState(() {
                        widget.user.fullname = _nameTextController.text;
                        widget.user.gender = _genderTextController.text;
                        widget.user.age = int.parse(_ageTextController.text);
                        widget.user.weight =
                            double.parse(_weightTextController.text);
                        widget.user.height =
                            double.parse(_heightTextController.text);
                        widget.user.foodAllergy =
                            _foodAllergyTextController.text;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ActivityForm()));
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: Text(
                      "ถัดไป",
                      style: TextStyle(fontSize: 32, color: Colors.white),
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
