import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:appfood2/widgets/button_back.dart';

class MilkMeatPage extends StatelessWidget {
  const MilkMeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: 1500,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ButtonBack(
                      colorCircle: Color.fromRGBO(130, 151, 223, 1),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: SectionMeat(),
            ),
            Expanded(flex: 20, child: SectionMilk())
          ],
        ),
      )),
    ));
  }
}

class SectionMilk extends StatelessWidget {
  const SectionMilk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
          child: Image.asset(
            'assets/images/FlagNutrition/milk_animal.png',
            width: 190,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: ContainTitlePeanut(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
          child: Text(
            '1 ส่วน',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(140, 72, 10, 1)),
          ),
        ),
        Image.asset(
          'assets/images/NutritionImg/peanutcut.png',
          width: 170,
          height: 100,
          fit: BoxFit.cover,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: BoxContainSugestion(),
        )
      ],
    );
  }
}

class ContainTitlePeanut extends StatelessWidget {
  const ContainTitlePeanut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(248, 219, 148, 1),
          borderRadius: BorderRadius.circular(20)),
      child: const Text(
        'ถั่ว',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BoxContainSugestion extends StatelessWidget {
  const BoxContainSugestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: DottedBorder(
        color: const Color.fromRGBO(208, 75, 139, 1),
        strokeWidth: 5,
        dashPattern: const [10, 10],
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'รับประทานในปริมาณพอ',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Row(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'เหมาะเพื่อให้ได้รับ',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  'โปรตีน',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(226, 43, 43, 1)),
                )
              ],
            ),
            Text(
              'เหล็ก และแคลเซียม',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(226, 43, 43, 1)),
            )
          ],
        ),
      ),
    );
  }
}

class SectionMeat extends StatelessWidget {
  const SectionMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ContainTitleMeat(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextDetailMeat(),
          ),
          ImageMeat(),
          ContainTextMilkProduct(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              child: Column(
                children: [
                  Text(
                    'นม',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'วันละ1-2 แก้ว',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(80, 78, 175, 1)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'หรือผลิตภัณฑ์จากนม',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'เช่น โยเกิร์ต นมเปรี้ยว ชีส',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(80, 78, 175, 1)),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageMeat extends StatelessWidget {
  const ImageMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Image.asset(
        'assets/images/FlagNutrition/animal.png',
        width: 190,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TextDetailMeat extends StatelessWidget {
  const TextDetailMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'เนื้อสัตว์วันละ\n6-10 ช้อนโต๊ะ',
      style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(231, 81, 81, 1)),
      textAlign: TextAlign.center,
    );
  }
}

class ContainTitleMeat extends StatelessWidget {
  const ContainTitleMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(223, 170, 177, 1)),
      child: const Text(
        'เนื้อสัตว์',
        style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ContainTextMilkProduct extends StatelessWidget {
  const ContainTextMilkProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(235, 193, 255, 1),
            borderRadius: BorderRadius.circular(20)),
        child: const Text(
          'นมหรือผลิตภัณฑ์\nจากนม',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
