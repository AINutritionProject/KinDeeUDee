import 'dart:io';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AIOutputPage extends StatelessWidget {
  const AIOutputPage({super.key, required this.foodImage});
  final XFile? foodImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(title: const Text("AI Output Page")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      "assets/images/RealFruit/10.jpg",
                      fit: BoxFit.cover,
                    ),
                  )),
              const ChemicalDetail(power: 24, fiber: 30, sugar: 34),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.yellow),
                child: Column(
                  children: [
                    const Text("ปริมาณ แอฟเปิ้ล"),
                    const Text("ของคุณ แจ่มใส"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Image.file(
                          File(foodImage!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Align(
                    child: Text(
                  "แนะนำรับประทารครั้งละ 1 ส่วน",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white),
                child: const Column(
                  children: [
                    Text(
                      "กดที่นี่",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("เพื่อดูข้อมูลทางโภชนาการเพิ่มเติม",
                        style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
