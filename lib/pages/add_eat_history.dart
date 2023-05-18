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
  final TextEditingController _quantityController = TextEditingController();
  String _unit = "1";
  final List<String> _radioValues = ["ผล", "ส่วน", "กรัม", "ขนาดพอคำ"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: const Text("Add eat history page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 55, right: 54, top: 5),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  height: 116,
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
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28, left: 30, right: 200),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 69,
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
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28, left: 30, right: 200),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 69,
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
                          keyboardType: TextInputType.number)),
                  Column(
                    children: [
                      ListTile(
                        title: const Text("ผล"),
                        leading: Radio(
                            value: _radioValues[0],
                            groupValue: _unit,
                            onChanged: (value) {
                              setState(() {
                                _unit = value.toString();
                              });
                            }),
                      ),
                      ListTile(
                        title: const Text("ส่วน"),
                        leading: Radio(
                            value: _radioValues[1],
                            groupValue: _unit,
                            onChanged: (value) {
                              setState(() {
                                _unit = value.toString();
                              });
                            }),
                      ),
                      ListTile(
                        title: const Text("กรัม"),
                        leading: Radio(
                            value: _radioValues[2],
                            groupValue: _unit,
                            onChanged: (value) {
                              setState(() {
                                _unit = value.toString();
                              });
                            }),
                      ),
                      ListTile(
                        title: const Text("ขนาดพอคำ"),
                        leading: Radio(
                            value: _radioValues[3],
                            groupValue: _unit,
                            onChanged: (value) {
                              setState(() {
                                _unit = value.toString();
                              });
                            }),
                      ),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EatConfirmPage(
                          image: image,
                          name: _foodNameController.text,
                          quantity: int.parse(_quantityController.text),
                          unit: _unit)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(FontAwesomeIcons.arrowDown),
                      SizedBox(
                        width: 10,
                      ),
                      Text("นำเข้ารูปภาพ")
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.orange, shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CameraPage(
                          replaceWhenNavigate: true,
                          foodName: _foodNameController.text,
                          quantiy: int.parse(_quantityController.text),
                          unit: _unit)));
                },
                icon: const Icon(Icons.camera_alt, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
