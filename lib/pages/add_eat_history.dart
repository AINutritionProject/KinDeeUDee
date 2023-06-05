import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/camera.dart';
import 'package:appfood2/pages/eat_confirm.dart';
import 'package:image_picker/image_picker.dart';

class AddEatHistoryPage extends StatefulWidget {
  const AddEatHistoryPage({super.key});

  @override
  State<AddEatHistoryPage> createState() => _AddEatHistoryPageState();
}

class _AddEatHistoryPageState extends State<AddEatHistoryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _quantityController =
      TextEditingController(text: '1');
  String _unit = "ผล";
  final List<String> _radioValues = ["ผล", "ส่วน", "กรัม", "ขนาดพอคำ"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 55, right: 54, top: 5),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(175, 236, 255, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "เพิ่มประวัติการ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "รับประทานอาหาร",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 28, left: 30, right: 200, bottom: 15),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 169, 90, 1),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Text(
                        "ชื่ออาหาร",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 52, right: 52),
                      child: TextFormField(
                          controller: _foodNameController,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 12)))),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 28, left: 30, right: 200, bottom: 15),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(136, 158, 238, 1),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Text(
                        "ปริมาณ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 52, right: 52),
                      child: TextFormField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 12)))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 50, top: 15),
                          child: SizedBox(
                            width: 150,
                            child: ListTile(
                              title: const Text(
                                "ผล",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              leading: Radio(
                                  activeColor: Colors.black,
                                  value: _radioValues[0],
                                  groupValue: _unit,
                                  onChanged: (value) {
                                    setState(() {
                                      _unit = value.toString();
                                    });
                                  }),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: SizedBox(
                            width: 151,
                            child: ListTile(
                              title: const Text(
                                "ส่วน",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              leading: Radio(
                                  activeColor: Colors.black,
                                  value: _radioValues[1],
                                  groupValue: _unit,
                                  onChanged: (value) {
                                    setState(() {
                                      _unit = value.toString();
                                    });
                                  }),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: SizedBox(
                            width: 151,
                            child: ListTile(
                              title: const Text(
                                "กรัม",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              leading: Radio(
                                  activeColor: Colors.black,
                                  value: _radioValues[2],
                                  groupValue: _unit,
                                  onChanged: (value) {
                                    setState(() {
                                      _unit = value.toString();
                                    });
                                  }),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 25, bottom: 15),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            width: 225,
                            child: ListTile(
                              title: const Text(
                                "ขนาดพอคำ",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              leading: Radio(
                                  activeColor: Colors.black,
                                  value: _radioValues[3],
                                  groupValue: _unit,
                                  onChanged: (value) {
                                    setState(() {
                                      _unit = value.toString();
                                    });
                                  }),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(
                      source: ImageSource.gallery,
                      maxWidth: 800,
                      maxHeight: 800,
                    );
                    if (image == null) {
                      return;
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EatConfirmPage(
                            image: image,
                            name: _foodNameController.text,
                            quantity: int.parse(_quantityController.text),
                            unit: _unit)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 63, bottom: 49),
                    child: Container(
                      width: 213,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: FaIcon(FontAwesomeIcons.arrowDown),
                          ),
                          Text(
                            "นำเข้ารูปภาพ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 70),
              decoration: const BoxDecoration(
                  color: Colors.orange, shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {
                  // validate form
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CameraPage(
                          replaceWhenNavigate: true,
                          foodName: _foodNameController.text,
                          quantiy: int.parse(_quantityController.text),
                          unit: _unit)));
                },
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 75,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
