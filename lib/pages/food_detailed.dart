import 'package:flutter/material.dart';
import 'package:appfood2/pages/ai_output.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.detail});
  final FoodNutritionDetail detail;
  Color _getGIColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(233, 255, 223, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(250, 248, 232, 1);
    } else {
      return const Color.fromRGBO(255, 228, 228, 1);
    }
  }

  Color _getBarColor(num giIndex) {
    if (giIndex < 55) {
      return const Color.fromRGBO(162, 223, 133, 1);
    } else if (giIndex < 70 && giIndex >= 55) {
      return const Color.fromRGBO(249, 241, 176, 1);
    } else {
      return const Color.fromRGBO(255, 141, 141, 1);
    }
  }

//detail.realImageAssetPath ?? "assets/cameraFrame.png",
/*
ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48 * 3),
              child: Image.asset(
                detail.realImageAssetPath ?? "assets/cameraFrame.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getGIColor(detail.giIndex),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 43),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 158,
                        color: _getGIColor(detail.giIndex),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 38),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          color: _getBarColor(detail.giIndex),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 85),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: FloatingActionButton(
                                backgroundColor: const Color.fromRGBO(86, 61, 51, 1),
                                onPressed: () {Navigator.pop(context);},
                                child: const Center(
                                  child: Text("<",style: TextStyle(fontSize: 35),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 54, right: 54),
                        child: Container(
                          alignment: Alignment.center,
                          height: 76,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Colors.white,
                          ),
                          child: Text(
                            detail.name,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48 * 3),
                      child: Image.asset(
                        detail.realImageAssetPath ?? "assets/cameraFrame.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const TextDataNutrition(),
                AmountDetailObject(
                  textAmountOfObj: '${detail.name}\n 1 ส่วน 120 กรัม',
                  colorBox: const Color.fromRGBO(255, 255, 255, 1),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: ChemicalDetail(
                      power: detail.power,
                      fiber: detail.fiber,
                      sugar: detail.sugar),
                ),
                const BenefitDetailContainer(
                  textBenefitDetail:
                      "ช่วยป้องกันการเกิดโรคหลอดเลือดหัวใจ\nช่วยให้ผนังหลอดเลือดแข็งแรง\nป้องกันการเกิดโรคต้อกระจก\nลดกรดในกระเพาะอาหาร ช่วยละลายเสมหะ\nลดความดันโลหิต ช่วยบำรุงหัวใจ",
                ),
                const ClickHereContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 255, 223, 1),
      appBar: AppBar(title: const Text("AI Output Page")),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TitleHeaderBox(textTitle: 'แอปเปิ้ลแดงฟูจิ',),
              ImageContainer(pathImage: "assets/images/RealFruit/10.jpg",),
              TextDataNutrition(),
              AmountDetailObject(textAmountOfObj: 'แอปเปิ้ล\n 1 ส่วน 120 กรัม',),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ChemicalDetail(power: 24, fiber: 30, sugar: 34),
              ),
              BenefitDetailContainer(textBenefitDetail: "ช่วยป้องกันการเกิดโรคหลอดเลือดหัวใจ\nช่วยให้ผนังหลอดเลือดแข็งแรง\nป้องกันการเกิดโรคต้อกระจก\nลดกรดในกระเพาะอาหาร ช่วยละลายเสมหะ\nลดความดันโลหิต ช่วยบำรุงหัวใจ",),
              ClickHereContainer(),
            ],
          ),
        ),
      ),
    );
  }
*/

class ChemicalDetail extends StatelessWidget {
  const ChemicalDetail({
    super.key,
    required this.power,
    required this.fiber,
    required this.sugar,
  });
  final num power;
  final num fiber;
  final num sugar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Container(
            //padding: const EdgeInsets.all(30),

            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("พลังงาน",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  "$power",
                  style: const TextStyle(
                      color: Color.fromRGBO(9, 183, 173, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                const Text("กิโลแคลอรี่",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Container(
            //padding: const EdgeInsets.all(30),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ใยอาหาร",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  "$fiber",
                  style: const TextStyle(
                      color: Color.fromRGBO(9, 183, 173, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                const Text("กรัม",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Container(
            //padding: const EdgeInsets.all(30),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "น้ำตาล",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$sugar",
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 141, 35, 1),
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                const Text("กรัม",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
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
  final num giIndex;
  final String benefit;
  final num power;
  final num fiber;
  final num sugar;
}
