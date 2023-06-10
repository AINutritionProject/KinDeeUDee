import 'dart:io';
import 'package:appfood2/pages/all_food.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/ai_output.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';

class EatConfirmPage extends StatefulWidget {
  const EatConfirmPage(
      {super.key, required this.image, this.name, this.unit, this.quantity});
  final XFile? image;
  final String? name, unit;
  final int? quantity;

  @override
  State<EatConfirmPage> createState() => _EatConfirmPageState();
}

class _EatConfirmPageState extends State<EatConfirmPage> {
  late Interpreter _intepreter;

  Future<void> _loadModel() async {
    final gpuDelegateV2 = GpuDelegateV2(
        options: GpuDelegateOptionsV2(
      isPrecisionLossAllowed: false,
    ));
    var interpreterOptions = InterpreterOptions()..addDelegate(gpuDelegateV2);
    try {
      _intepreter = await Interpreter.fromAsset('assets/models/detect.tflite',
          options: InterpreterOptions());
    } catch (e) {
      print("=============Unable to add GPU===================");
      print(e);
      print("===========================================");
      _intepreter = await Interpreter.fromAsset('assets/models/detect.tflite',
          options: InterpreterOptions());
    }
  }

  @override
  void initState() {
    super.initState();
    _loadModel().then(
      (value) {
        print("Loadmodel success");
      },
    );
  }

  Future<void> _saveEatHistory() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final nowTimestamp = DateTime.now().millisecondsSinceEpoch;
    final filePath = "history/$uid/$nowTimestamp";
    final storageRef = FirebaseStorage.instance.ref().child(filePath);
    await storageRef.putFile(File(widget.image!.path));
    final String downloadUrl = await storageRef.getDownloadURL();
    await FirebaseFirestore.instance.collection("eatHistory").add({
      "uid": uid,
      "timestamp": nowTimestamp,
      "foodName": widget.name ?? "ไม่มีชื่อ",
      "quantity": widget.quantity ?? 0,
      "unit": widget.unit ?? "ไร้หน่วย",
      "foodPhoto": downloadUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 340,
            width: 340,
            child: Image.file(
              File(widget.image!.path),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "คุณต้องการรับประทาน\n        อาหารชนิดนี้?",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _saveEatHistory();
                  // ignore: use_build_context_synchronously
                  if (widget.image != null) {
                    Map<int, List<dynamic>> outputs = {
                      0: List.filled(10, 0.0).reshape([1, 10]),
                      1: List.filled(10 * 4, 0.0).reshape([1, 10, 4]),
                      2: List.filled(1, 0).reshape([1]),
                      3: List.filled(10, 0).reshape([1, 10])
                    };
                    final img.Image baseImage = img.decodeImage(
                        File(widget.image!.path).readAsBytesSync())!;
                    print("${baseImage.height}  ${baseImage.width}");
                    final img.Image resizedImage =
                        img.copyResize(baseImage, width: 320, height: 320);

                    var imageBytes = resizedImage.getBytes();
                    var normalizedImageBytes = Float32List(imageBytes.length);
                    for (var i = 0; i < normalizedImageBytes.length; i++) {
                      normalizedImageBytes[i] = (imageBytes[i] - 127.5) / 127.5;
                      // normalizedImageBytes[i] = imageBytes[i].toDouble();
                    }
                    print(normalizedImageBytes.length);
                    var inputs = [
                      normalizedImageBytes.reshape([1, 320, 320, 3])
                    ];
                    print("____________INPUTS____________");
                    var t1 = DateTime.now().millisecondsSinceEpoch;
                    _intepreter.runForMultipleInputs(inputs, outputs);
                    var t2 = DateTime.now().millisecondsSinceEpoch;
                    print("elapsed time: ${t2 - t1} ms");
                    print(outputs[0]);
                    print(outputs[1]);
                    print(outputs[2]);
                    print(outputs[3]);
                    print("____________END-INPUTS____________");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Scaffold(
                              appBar: AppBar(title: Text("EEEE")),
                            )));
                  } else {
                    return;
                  }
                  const Food resultFood = Food(
                      name: "test",
                      type: "Fruit",
                      imageAssetPath: "",
                      detail: FoodNutritionDetail(
                          name: "test test",
                          giIndex: 45.1,
                          benefit: "Nice it is very nice",
                          power: 333,
                          fiber: 333,
                          sugar: 333,
                          protein: 333,
                          fat: 333,
                          carbo: 333,
                          nutrition: "test 1 grams"));

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AIOutputPage(
                            foodImage: widget.image,
                            food: resultFood,
                          )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(177, 254, 150, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 53,
                  child: const Text(
                    "ใช่",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(250, 138, 138, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 53,
                  child: const Text(
                    "ไม่",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
