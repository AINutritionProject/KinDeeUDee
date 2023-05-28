import 'package:flutter/material.dart';

class FoodAdvanceDetailPage extends StatelessWidget {
  const FoodAdvanceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 248, 225, 1),
      appBar: AppBar(title: const Text("Food Advance Detail")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 45, 0, 20),
              child: Container(
                padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                constraints: const BoxConstraints(
                  minWidth: 100,
                  minHeight: 50
                ),
                child: const Text(
                  'กล้วยไข่,สุก',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 55),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(191, 255, 161, 1),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  'น้ำหนัก 100 กรัม',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            const BoxNutritionDetail(textDetailLeft: 'พลังงาน\n111\nกิโลแคลอรี่', textDetailRight: 'พลังงาน\n111\nกิโลแคลอรี่',),
            const BoxNutritionDetail(textDetailLeft: 'พลังงาน\n111\nกิโลแคลอรี่', textDetailRight: 'พลังงาน\n111\nกิโลแคลอรี่'),
            const BoxNutritionDetail(textDetailLeft: 'พลังงาน\n111\nกิโลแคลอรี่', textDetailRight: 'พลังงาน\n111\nกิโลแคลอรี่'),
            
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class BoxNutritionDetail extends StatelessWidget {
  const BoxNutritionDetail({
    super.key,
    required this.textDetailLeft,
    required this.textDetailRight
  });

  final String textDetailLeft;
  final String textDetailRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              children: [
                Text(textDetailLeft, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)
            ),
            child:  const Column(
              children: [
                Text('พลังงาน\n111\nกิโลแคลอรี่', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
