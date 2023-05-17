import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/ai_output.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EatConfirmPage extends StatelessWidget {
  const EatConfirmPage(
      {super.key, required this.image, this.name, this.unit, this.quantity});
  final XFile? image;
  final String? name, unit;
  final int? quantity;

  Future<void> _saveEatHistory() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final nowTimestamp = DateTime.now().millisecondsSinceEpoch;
    final filePath = "history/$uid/$nowTimestamp";
    final storageRef = FirebaseStorage.instance.ref().child(filePath);
    await storageRef.putFile(File(image!.path));
    final String downloadUrl = await storageRef.getDownloadURL();
    await FirebaseFirestore.instance.collection("eatHistory").add({
      "uid": uid,
      "timestamp": nowTimestamp,
      "foodName": name ?? "yee",
      "quantity": quantity ?? 999,
      "unit": unit ?? "หิโมะ",
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
              File(image!.path),
            ),
          ),
          const Text(
            "คุณต้องการรับประทาน\n        อาหารชนิดนี้",
            style: TextStyle(fontSize: 30),
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AIOutputPage(foodImage: image)));
                },
                child: const Text("ใช่"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("ไม่"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
