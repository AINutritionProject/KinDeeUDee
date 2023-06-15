import 'dart:io';
import 'package:appfood2/pages/all_food.dart';
import 'package:appfood2/pages/food_advance_detail.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/pages/food_detailed.dart';
import 'package:appfood2/widgets/button_back.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AIOutputPage extends StatelessWidget {
  const AIOutputPage({super.key, required this.foodImage, required this.food});
  final XFile? foodImage;
  final Food food;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );

    return Scaffold(
      //backgroundColor: const Color.fromRGBO(233, 255, 223, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: screenSizeData.screenWidth <= screenSizeData.maxWidth
                ? Colors.white
                : Colors.black,
            child: Center(
              child: Container(
                width: screenSizeData.screenSizeWidth,
                color: FoodDetailPage(detail: food.detail).getGIColor(food.detail.giIndex),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                      child: Container(
                        width: screenSizeData.screenSizeWidth,
                        height: screenSizeData.screenHeight * 0.15,
                        color: FoodDetailPage(detail: food.detail).getBarColor(food.detail.giIndex),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ButtonBack(
                                    colorCircle: const Color.fromRGBO(86, 61, 51, 1),
                                    color: FoodDetailPage(detail: food.detail).getColorIconBack(food.detail.giIndex),
                                  )),
                            ),
                            Positioned(
                              top: screenSizeData.screenHeight * 0.15 - 35,
                              left: screenSizeData.screenSizeWidth * 0.5 - 134,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: TitleHeaderBox(
                                  textTitle: food.detail.name,
                                  width: screenSizeData.screenSizeWidth,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 25, 30),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    FoodDetailPage(
                                      detail: food.detail,
                                    ).get_glycemic_index(food.detail.giIndex),
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            FoodDetailPage(detail: food.detail)
                                                .getBarsmilColor(
                                                    food.detail.giIndex),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.black,
                                        size: 60,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 6),
                                        shape: BoxShape.circle,
                                      ),
                                      width: 60,
                                      height: 60,
                                    )
                                  ],
                                ),
                              ),
                            )
                            // SmileFace(
                            //   SmileColor: Colors.green
                            // )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: ImageContainer(
                        pathImage: food.detail.realImageAssetPath ?? "t",
                        width: screenSizeData.screenSizeWidth,
                        color: FoodDetailPage(detail: food.detail).getBarColor(food.detail.giIndex),
                      ),
                    ),
                    const TextDataNutrition(),
                    AmountDetailObject(
                      textAmountOfObj: food.detail.nutrition,
                      colorBox: Colors.white,
                      width: screenSizeData.screenSizeWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: ChemicalDetail(
                          power: food.detail.power,
                          fiber: food.detail.fiber,
                          sugar: food.detail.sugar
                          ),
                    ),
                    AmountObjectofUser(
                      foodImage: foodImage,
                      width: screenSizeData.screenSizeWidth,
                    ),
                    PartOfObject(width: screenSizeData.screenSizeWidth),
                    SugestBox(
                      width: screenSizeData.screenSizeWidth,
                    ),
                    BenefitDetailContainer(
                      textBenefitDetail: food.detail.benefit,
                      width: screenSizeData.screenSizeWidth,
                    ),
                    ClickHereContainer(
                      foodDetail: food.detail,
                      width: screenSizeData.screenSizeWidth,
                    ),
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

class PartOfObject extends StatelessWidget {
  const PartOfObject({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        width: width * 0.8,
        height: width * 0.6,
        decoration: const BoxDecoration(
            color: Colors.white,
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
  const AmountObjectofUser(
      {super.key, required this.foodImage, required this.width});

  final XFile? foodImage;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
                width: width * 0.35,
                height: width * 0.38,
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
      {super.key,
      required this.textAmountOfObj,
      required this.colorBox,
      required this.width});

  final String textAmountOfObj;
  final Color colorBox;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Container(
        width: width * 0.7,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //width: MediaQuery.of(context).size.width * 0.68,
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
                    fontSize: 32, fontWeight: FontWeight.bold, height: 1.8),
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
  const ImageContainer(
      {super.key, required this.pathImage, required this.width, required this.color});
  final String pathImage;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        width: width * 0.6,
        height: width * 0.6,
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
  const SugestBox({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
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
  const TitleHeaderBox(
      {super.key, required this.textTitle, required this.width});
  final String textTitle;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268,
      height: (textTitle.length > 16) ? 111 : 76,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Text(
          textTitle,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ClickHereContainer extends StatelessWidget {
  const ClickHereContainer(
      {super.key, required this.foodDetail, required this.width});
  final FoodNutritionDetail foodDetail;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Container(
        width: width * 0.9,
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
                    fontSize: 24,
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
  const BenefitDetailContainer(
      {super.key, required this.textBenefitDetail, required this.width});
  final String textBenefitDetail;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              //margin: const EdgeInsets.fromLTRB(120, 10, 120, 12),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 194, 227, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'ประโยชน์',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
