import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/ai_output.dart';

class EatConfirmPage extends StatelessWidget {
  const EatConfirmPage({super.key, required this.image});
  final XFile? image;

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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AIOutputPage()));
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
