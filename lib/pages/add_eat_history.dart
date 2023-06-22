import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/camera.dart';
import 'package:appfood2/pages/eat_confirm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/widgets/button_back.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> SaveEatHistory(
    String name, int quantiy, String unit, XFile image) async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final nowTimestamp = DateTime.now().millisecondsSinceEpoch;
  final filePath = "history/$uid/$nowTimestamp";
  final storageRef = FirebaseStorage.instance.ref().child(filePath);
  await storageRef.putFile(File(image.path));
  final String downloadUrl = await storageRef.getDownloadURL();
  await FirebaseFirestore.instance.collection("eatHistory").add({
    "uid": uid,
    "timestamp": nowTimestamp,
    "foodName": name,
    "quantity": quantiy,
    "unit": unit,
    "foodPhoto": downloadUrl,
  });
}

Future<void> SaveEatHistoryToLocal(
    String name, int quantiy, String unit, XFile image) async {
  final pref = await SharedPreferences.getInstance();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final List<String> currentHistory =
      pref.getStringList("EatHistoryOf-$uid") ?? [];
  final nowTimestamp = DateTime.now().millisecondsSinceEpoch;
  final imageBytes = await image.readAsBytes();
  String base64Image = base64Encode(imageBytes);
  currentHistory.add("EatHistoryOf-$uid-$nowTimestamp");

  Map<String, dynamic> history = {
    "timestamp": nowTimestamp,
    "foodName": name,
    "quantity": quantiy,
    "unit": unit,
    "foodPhoto": base64Image,
  };
  final String historyString = jsonEncode(history);
  // print('saving history: $historyString');
  await pref.setString("EatHistoryOf-$uid-$nowTimestamp", historyString);
  await pref.setStringList("EatHistoryOf-$uid", currentHistory);
}

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

  Future<void> _next(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: source, maxWidth: 320, maxHeight: 320);
    if (image == null) {
      return;
    }
    SaveEatHistoryToLocal(_foodNameController.value.text,
            int.parse(_quantityController.value.text), _unit, image)
        .then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
    await showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        barrierDismissible: false);
  }

  final List<String> _radioValues = ["ผล", "ส่วน", "กรัม", "ขนาดพอคำ"];
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      body: SafeArea(
        child: Container(
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: Container(
              color: Colors.yellow.shade50,
              width: screenSizeData.screenSizeWidth,
              height: screenSizeData.screenHeight,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSizeData.screenSizeWidth < 600 ? 10 : 30,
                          left: 20),
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: ButtonBack(
                            colorCircle: Color.fromRGBO(130, 151, 223, 1),
                            color: Colors.white,
                            sizeCircle: 60,
                            size: 60,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSizeData.screenSizeWidth < 600 ? 20 : 40),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: screenSizeData.screenSizeWidth * 0.15),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(175, 236, 255, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "เพิ่มประวัติการ\nรับประทานอาหาร",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20,
                                top: screenSizeData.screenHeight * 0.03,
                                bottom: screenSizeData.screenHeight * 0.025),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 30),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 169, 90, 1),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: const Text(
                                  "ชื่ออาหาร",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 52, right: 52),
                              child: TextFormField(
                                  controller: _foodNameController,
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 12)))),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20,
                                top: screenSizeData.screenHeight * 0.015,
                                bottom: screenSizeData.screenHeight * 0.025),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 30),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(136, 158, 238, 1),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: const Text(
                                  "ปริมาณ",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 52, right: 52),
                              child: TextFormField(
                                  controller: _quantityController,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 12)))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: screenSizeData.screenSizeWidth < 600
                                          ? screenSizeData.screenSizeWidth *
                                              0.25
                                          : screenSizeData.screenSizeWidth *
                                              0.35,
                                      top: screenSizeData.screenHeight * 0.025),
                                  child: SizedBox(
                                    //width: 200,
                                    child: ListTile(
                                      title: const Text(
                                        "ผล",
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700),
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
                                  padding: EdgeInsets.only(
                                    left: screenSizeData.screenSizeWidth < 600
                                        ? screenSizeData.screenSizeWidth * 0.25
                                        : screenSizeData.screenSizeWidth * 0.35,
                                  ),
                                  child: SizedBox(
                                    //width: 200,
                                    child: ListTile(
                                      title: const Text(
                                        "ส่วน",
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700),
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
                                  padding: EdgeInsets.only(
                                    left: screenSizeData.screenSizeWidth < 600
                                        ? screenSizeData.screenSizeWidth * 0.25
                                        : screenSizeData.screenSizeWidth * 0.35,
                                  ),
                                  child: SizedBox(
                                    //width: 200,
                                    child: ListTile(
                                      title: const Text(
                                        "กรัม",
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700),
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
                                  padding: EdgeInsets.only(
                                      left: screenSizeData.screenSizeWidth < 600
                                          ? screenSizeData.screenSizeWidth *
                                              0.25
                                          : screenSizeData.screenSizeWidth *
                                              0.35,
                                      bottom: 10),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    //width: 225,
                                    child: ListTile(
                                      title: const Text(
                                        "ขนาดพอคำ",
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700),
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
                          onTap: () {
                            _next(ImageSource.gallery);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenSizeData.screenHeight * 0.05,
                                left: screenSizeData.screenSizeWidth < 600
                                    ? 45
                                    : 60,
                                bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 188, 188, 1),
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
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
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSizeData.screenHeight * 0.05, bottom: 35),
                      child: Container(
                        width: 100,
                        height: 100,
                        //margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {
                            // validate form
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _next(ImageSource.camera);
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 75,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
