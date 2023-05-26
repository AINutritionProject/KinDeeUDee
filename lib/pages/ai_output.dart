import 'dart:io';
import 'package:appfood2/pages/food_advance_detail.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AIOutputPage extends StatelessWidget {
  const AIOutputPage({super.key, required this.foodImage});
  final XFile? foodImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 255, 223, 1),
      appBar: AppBar(title: const Text("AI Output Page")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const TitleHeaderBox(
                textTitle: 'แอปเปิ้ลแดงฟูจิ',
              ),
              const ImageContainer(
                pathImage: "assets/images/RealFruit/10.jpg",
              ),
              const TextDataNutrition(),
              const AmountDetailObject(textAmountOfObj: 'แอปเปิ้ล\n 1 ส่วน 120 กรัม', colorBox: Color.fromRGBO(175, 255, 207, 1),),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ChemicalDetail(power: 24, fiber: 30, sugar: 34),
              ),
              AmountObjectofUser(foodImage: foodImage),
              const PartOfObject(),
              const SugestBox(),
              const BenefitDetailContainer(
                textBenefitDetail:
                    "ช่วยป้องกันการเกิดโรคหลอดเลือดหัวใจ\nช่วยให้ผนังหลอดเลือดแข็งแรง\nป้องกันการเกิดโรคต้อกระจก\nลดกรดในกระเพาะอาหาร ช่วยละลายเสมหะ\nลดความดันโลหิต ช่วยบำรุงหัวใจ",
              ),
              const ClickHereContainer(),
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
                    'assets/images/RealFruit/10.jpg',
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
                    'assets/images/RealFruit/10.jpg',
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
  const AmountDetailObject({
    super.key,
    required this.textAmountOfObj,
    required this.colorBox
  });

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
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            textTitle,
            style:
                const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ClickHereContainer extends StatelessWidget {
  const ClickHereContainer({
    super.key,
  });

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
                    builder: (context) => const FoodAdvanceDetailPage()));
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
      height: MediaQuery.of(context).size.height * 0.34,
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Container(
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
          Center(
              child: Text(
            textBenefitDetail,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 19, fontWeight: FontWeight.bold, height: 2),
          )),
        ],
      ),
    );
  }
}
