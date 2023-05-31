import 'package:flutter/material.dart';
import 'package:appfood2/db.dart';

class Nutrition extends StatelessWidget {
  final User user;
  const Nutrition({
    super.key,
    required this.user,
  });

  static const List dataInSection = [
    {
      'name': 'ข้าว-แป้ง',
      'nameAmount': 'ทัพพี',
      'amountWiget': {
        5: FiveSpoonRice(),
        7: SevenSpoonRice(),
        9: NineSpoonRice()
      },
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/peanutcut.png"
    },
    {
      'name': 'ผัก',
      'nameAmount': 'ทัพพี',
      'amountWiget': {3: ThreeSpoonVeg()},
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/peanutcut.png"
    },
    {
      'name': 'ผลไม้',
      'nameAmount': 'ส่วน',
      'amountWiget': {2: TwoFruit(), 3: ThreeFruit(), 4: FourFruit()},
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/peanutcut.png"
    },
    {
      'name': 'เนื้อสัตว-ไข่',
      'nameAmount': 'ข้อนโต้ะ',
      'amountWiget': {
        7: SevenMeat(),
        8: EightMeat(),
        9: NineMeat(),
        10: TenMeat()
      },
      'sugest': 'ไข่ 1 ฟอง = เนื้อสัตว์ 2 ช้อนโต๊ะ',
      'imgTypeNutritionPath': "assets/images/NutritionImg/Meats.png"
    },
    {
      'name': 'ถั่ว',
      'nameAmount': 'ส่วน',
      'amountWiget': {1: OnePeanut()},
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/peanutcut.png"
    },
    {
      'name': 'ผลิตภัณฑ์จากนม',
      'nameAmount': 'แก้ว',
      'amountWiget': {0: ZeroMilk(), 1: OneMilk(), 2: OneMilk()},
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/MilkProductcut.png"
    },
    {
      'name': 'น้ำ',
      'nameAmount': 'แก้ว',
      'amountWiget': {8: EightWater()},
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/WaterProductcut.png"
    },
    {
      'name': 'น้ำมัน',
      'nameAmount': 'ช้อนชา',
      'amountWiget': {5: FiveOil(), 6: SixOil(), 7: SevenOil(), 8: EightOil()},
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/WaterProductcut.png"
    },
    {
      'name': 'น้ำตาล',
      'nameAmount': 'ช้อนชา',
      'amountWiget': {6: SixSugar()},
      'sugest': '',
      'imgTypeNutritionPath': "assets/images/NutritionImg/sugarcut.png"
    },
  ];
  static const List amountList = [5, 3, 4, 8, 1, 0, 8, 5, 6];

  //List<Widget> nutritionWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("nutririon")),
        body: SafeArea(
          child: ListView.builder(
            itemCount: dataInSection.length + 2,
            itemBuilder: (context, index) {
              if (index == dataInSection.length + 1) {
                return const ButtonSave();
              } else if (index == 0) {
                return const ContainerHeader(
                  calAmount: 1800,
                );
              } else {
                return SectionNutrition(
                    imgTypeNutritionPath: dataInSection[index - 1]
                        ['imgTypeNutritionPath'],
                    nameTypeNutrition: dataInSection[index - 1]['name'],
                    amount: amountList[index - 1],
                    nameAmount: dataInSection[index - 1]['nameAmount'],
                    widget: dataInSection[index - 1]['amountWiget']
                        [amountList[index - 1]]);
              }
            },
          ),
        ));
  }
}

class ButtonSave extends StatelessWidget {
  const ButtonSave({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.07,
          constraints: const BoxConstraints(minWidth: 120, minHeight: 55),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(126, 204, 237, 1),
              borderRadius: BorderRadius.circular(20)),
          child: const Center(
            child: Text(
              'บันทึก',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionNutrition extends StatelessWidget {
  const SectionNutrition(
      {super.key,
      required this.imgTypeNutritionPath,
      required this.nameTypeNutrition,
      required this.amount,
      required this.nameAmount,
      required this.widget,
      this.detail
      //required this.widthTypeImg,
      //required this.heightTypeImg
      });
  final String imgTypeNutritionPath;
  final String nameTypeNutrition;
  final int amount;
  final Widget widget;
  final String nameAmount;
  final String? detail;
  //final double widthTypeImg;
  //final double heightTypeImg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.844,
          //height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 4, color: const Color.fromRGBO(255, 247, 204, 1))),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                    child: DetailLeft(
                        nameTypeNutrition: nameTypeNutrition,
                        imgTypeNutritionPath: imgTypeNutritionPath),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                    child: DetailRight(
                        amount: amount, nameAmount: nameAmount, widget: widget),
                  ),
                  //const Text('')
                ],
              ),
              nameTypeNutrition == 'นื้อสัตว- ไข่'
                  ? const Text(
                      'ไข่ 1 ฟอง = เนื้อสัตว์ 2 ช้อนโต๊ะ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  : const SizedBox()
            ],
          )),
    );
  }
}

class DetailRight extends StatelessWidget {
  const DetailRight({
    super.key,
    required this.amount,
    required this.nameAmount,
    required this.widget,
  });

  final int amount;
  final String nameAmount;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$amount  $nameAmount',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: 150,
            height: 80,
            child: widget,
          ),
        ),
      ],
    );
  }
}

class DetailLeft extends StatelessWidget {
  const DetailLeft({
    super.key,
    required this.nameTypeNutrition,
    required this.imgTypeNutritionPath,
  });

  final String nameTypeNutrition;
  final String imgTypeNutritionPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          nameTypeNutrition,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Image.asset(
                imgTypeNutritionPath,
                width: 120,
                height: 80,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ThreeSpoonVeg extends StatelessWidget {
  const ThreeSpoonVeg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/3-spoonveg.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class FiveSpoonRice extends StatelessWidget {
  const FiveSpoonRice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/5spoonRice.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class SevenSpoonRice extends StatelessWidget {
  const SevenSpoonRice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/7spoonRice.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class NineSpoonRice extends StatelessWidget {
  const NineSpoonRice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/9spoonRice.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class TwoFruit extends StatelessWidget {
  const TwoFruit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/2fruitPart.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class ThreeFruit extends StatelessWidget {
  const ThreeFruit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/3fruitPart.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class FourFruit extends StatelessWidget {
  const FourFruit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/4fruitPart.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class SixMeat extends StatelessWidget {
  const SixMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/6spoonMeat.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class SevenMeat extends StatelessWidget {
  const SevenMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/7spoonMeat.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class EightMeat extends StatelessWidget {
  const EightMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/8spoonMeat.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class NineMeat extends StatelessWidget {
  const NineMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/9spoonMeat.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class TenMeat extends StatelessWidget {
  const TenMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/10spoonMeat.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class EightWater extends StatelessWidget {
  const EightWater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/8waterCup.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class OneMilk extends StatelessWidget {
  const OneMilk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/waterCupcut.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 60,
      color: Colors.grey[700],
    );
  }
}

class SixSugar extends StatelessWidget {
  const SixSugar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/6spoonSugar.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class FiveOil extends StatelessWidget {
  const FiveOil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/5spoonOil.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class SixOil extends StatelessWidget {
  const SixOil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/6spoonOil.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class SevenOil extends StatelessWidget {
  const SevenOil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/7spoonOil.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class EightOil extends StatelessWidget {
  const EightOil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/8spoonOil.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class OnePeanut extends StatelessWidget {
  const OnePeanut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/peanutPart.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class ZeroMilk extends StatelessWidget {
  const ZeroMilk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/NutritionImg/NotMilkcut.png',
      fit: BoxFit.scaleDown,
      width: 150,
      height: 100,
    );
  }
}

class ContainerHeader extends StatelessWidget {
  const ContainerHeader({super.key, required this.calAmount});
  static const List<dynamic> calList = [
    {1400: AmountCalGreen(), 1600: AmountCalYellow(), 1800: AmountCalRed()}
  ];
  final int calAmount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Stack(
        children: [
          const Align(
            alignment: AlignmentDirectional(0, -0.8),
            child: TitleHeader(),
          ),
          const Align(
            alignment: AlignmentDirectional(-0.8, 0),
            child: TextCalRequire(),
          ),
          Align(
              alignment: const AlignmentDirectional(0, 0.7),
              child: calList[0][calAmount])
        ],
      ),
    );
  }
}

class AmountCalGreen extends StatelessWidget {
  const AmountCalGreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.076,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(209, 255, 150, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Center(
        child: Text(
          '1400 Kcal',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AmountCalYellow extends StatelessWidget {
  const AmountCalYellow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.076,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 244, 148, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Center(
        child: Text(
          '1600 Kcal',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AmountCalRed extends StatelessWidget {
  const AmountCalRed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.076,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 122, 122, 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Center(
        child: Text(
          '1800 Kcal',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TextCalRequire extends StatelessWidget {
  const TextCalRequire({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'พลังงานที่ต้องการต่อวัน',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );
  }
}

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(136, 158, 238, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
      child: const Center(
        child: Text(
          'ข้อมูลทางโภชนาการ',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
