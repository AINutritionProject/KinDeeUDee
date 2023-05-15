import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.detail});
  final FoodNutritionDetail detail;
  Color _getGIColor(double giIndex) {
    if (giIndex < 55) {
      return Colors.green.shade100;
    } else if (giIndex < 70 && giIndex >= 55) {
      return Colors.yellow.shade100;
    } else {
      return Colors.red.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodDetailPage"),
      ),
      backgroundColor: _getGIColor(detail.giIndex),
      body: Column(children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Text(
              detail.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )),
        Image.asset(
          detail.realImageAssetPath ?? "assets/cameraFrame.png",
          width: 300,
          height: 300,
        ),
        ChemicalDetail(
            power: detail.power, fiber: detail.fiber, sugar: detail.sugar),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "ประโยชน์",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(detail.benefit))
            ],
          ),
        )
      ]),
    );
  }
}

class ChemicalDetail extends StatelessWidget {
  const ChemicalDetail({
    super.key,
    required this.power,
    required this.fiber,
    required this.sugar,
  });
  final int power;
  final double fiber;
  final int sugar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              const Text("พลังงาน"),
              Text(
                "$power",
                style: const TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.w900),
              ),
              const Text("กโลแคลอรี่"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              const Text("ใยอาหาร"),
              Text(
                "$fiber",
                style: const TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.w900),
              ),
              const Text("กรัม"),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              const Text("น้ำตาล"),
              Text(
                "$sugar",
                style: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.w900),
              ),
              const Text("กรัม"),
            ],
          ),
        ),
      ],
    );
  }
}

class FoodNutritionDetail {
  const FoodNutritionDetail(
      {required this.name,
      required this.giIndex,
      this.realImageAssetPath,
      required this.benefit,
      required this.power,
      required this.fiber,
      required this.sugar});
  final String name;
  final String? realImageAssetPath;
  final double giIndex;
  final String benefit;
  final int power;
  final double fiber;
  final int sugar;
}
