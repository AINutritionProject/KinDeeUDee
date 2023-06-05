import 'dart:io';
import 'package:appfood2/pages/all_food.dart';
import 'package:appfood2/pages/food_advance_detail.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AIOutputPage extends StatelessWidget {
  const AIOutputPage({super.key, required this.foodImage, required this.food});
  final XFile? foodImage;
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 255, 223, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TitleHeaderBox(
                textTitle: food.detail.name,
              ),
              ImageContainer(
                pathImage: food.detail.realImageAssetPath ?? "t",
              ),
              const TextDataNutrition(),
              AmountDetailObject(
                textAmountOfObj: food.detail.nutrition,
                colorBox: const Color.fromRGBO(175, 255, 207, 1),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ChemicalDetail(
                    power: food.detail.power,
                    fiber: food.detail.fiber,
                    sugar: food.detail.sugar),
              ),
              AmountObjectofUser(foodImage: foodImage),
              const PartOfObject(),
              const SugestBox(),
              BenefitDetailContainer(textBenefitDetail: food.detail.benefit),
              ClickHereContainer(foodDetail: food.detail),
            ],
          ),
        ),
      ),
    );
  }
}

class PartOfObject extends StatelessWidget {
  const PartOfObject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(175, 255, 207, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            const Align(
                alignment: AlignmentDirectional(0, -0.8),
                child: Text(
                  'แอปเปิ้ล 1 ส่วน',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
            Align(
                alignment: const AlignmentDirectional(-0.7, 0.6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    't1',
                    width: 120,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                )),
            Align(
                alignment: const AlignmentDirectional(0.7, 0.6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    't2',
                    width: 120,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class AmountObjectofUser extends StatelessWidget {
  const AmountObjectofUser({
    super.key,
    required this.foodImage,
  });

  final XFile? foodImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromRGBO(255, 251, 212, 1)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "ปริมาณแอฟเปิ้ล",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Text(
              "ของคุณแจ่มใส",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.width * 0.38,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.file(
                    File(foodImage!.path),
                    fit: BoxFit.cover,
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

class AmountDetailObject extends StatelessWidget {
  const AmountDetailObject(
      {super.key, required this.textAmountOfObj, required this.colorBox});

  final String textAmountOfObj;
  final Color colorBox;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: MediaQuery.of(context).size.width * 0.68,
        //height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            color: colorBox,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            Center(
              child: Text(
                textAmountOfObj,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, height: 1.8),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextDataNutrition extends StatelessWidget {
  const TextDataNutrition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        'ข้อมูลโภชนาการ',
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(76, 36, 29, 1)),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.pathImage});
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.greenAccent.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.6,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Image.asset(
            pathImage,
            fit: BoxFit.cover,
          ),
        ));
  }
}

class SugestBox extends StatelessWidget {
  const SugestBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Align(
          child: Text("แนะนำรับประทานครั้งละ 1 ส่วน",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.bold))),
    );
  }
}

class TitleHeaderBox extends StatelessWidget {
  const TitleHeaderBox({super.key, required this.textTitle});
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.64,
        height: MediaQuery.of(context).size.height * 0.094,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            textTitle,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ClickHereContainer extends StatelessWidget {
  const ClickHereContainer({super.key, required this.foodDetail});
  final FoodNutritionDetail foodDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FoodAdvanceDetailPage(
                          name: 'eie',
                          foodDetail: foodDetail,
                        )));
              },
              child: const Text(
                "กดที่นี่",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              "เพื่อดูข้อมูลทางโภชนาการเพิ่มเติม",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class BenefitDetailContainer extends StatelessWidget {
  const BenefitDetailContainer({super.key, required this.textBenefitDetail});
  final String textBenefitDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Container(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              margin: const EdgeInsets.fromLTRB(120, 10, 120, 12),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 194, 227, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  'ประโยชน์',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              textBenefitDetail,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 19, fontWeight: FontWeight.bold, height: 2),
            ),
          ),
        ],
      ),
    );
  }
}
