import 'package:flutter/material.dart';
import 'package:appfood2/pages/oil.dart';
import 'package:appfood2/pages/rice_flour.dart';
import 'package:appfood2/pages/vet_fruit.dart';
import 'package:appfood2/pages/milk_meat.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:appfood2/widgets/button_back.dart';

class FlagNutrition extends StatelessWidget {
  const FlagNutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(74, 54, 131, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ButtonBack( colorCircle: Color.fromRGBO(201, 221, 220, 1),),
                    ),
                    Container(
                      //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(125, 144, 243, 1),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: const Center(
                        child: Text(
                          'เมนู',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          
                          ),
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'ธงโภชนาการ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: SizedBox(),
                                  ),
                                  FlagSectionFlour(),
                                  FlagSectionVegFruit(),
                                  FlagSectionMilkMeat(),
                                  FlagSectionOil()
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 25),
                                    child: ContainTitleWater(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: BoxSugestionWater(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    child: ContainEightCupWather(),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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



class ContainEightCupWather extends StatelessWidget {
  const ContainEightCupWather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/FlagNutrition/water.png',
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BoxSugestionWater extends StatelessWidget {
  const BoxSugestionWater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: DottedBorder(
        color: const Color.fromRGBO(137, 155, 220, 1),
        strokeWidth: 5,
        dashPattern: const [10, 10],
        borderType: BorderType.RRect,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        radius: const Radius.circular(20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'ควรดื่มน้ำวันละ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '8 แก้ว',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class ContainTitleWater extends StatelessWidget {
  const ContainTitleWater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(200, 234, 241, 1),
          borderRadius: BorderRadius.circular(20)),
      child: const Text(
        'น้ำ',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FlagSectionOil extends StatelessWidget {
  const FlagSectionOil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 26,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const OilPage()));
        },
        child: Container(
          padding: const EdgeInsets.symmetric( horizontal: 5),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(252, 246, 234, 1),
              border: Border.all(color: Colors.white, width: 7)),
          child: Column(
            children: [
              Image.asset(
                'assets/images/FlagNutrition/oil.png',
                width: 70,
                height: 46,
                fit: BoxFit.cover,
              ),
              const Text(
                'น้ำมัน\nเครื่องปรุง',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, height: 1.6),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlagSectionMilkMeat extends StatelessWidget {
  const FlagSectionMilkMeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 24,
      child: SizedBox(
        //height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MilkMeatPage()));
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 2, 5),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(175, 216, 247, 1),
                      border: Border.all(width: 7, color: Colors.white)
                  ),
                  constraints: const BoxConstraints(
                    maxWidth: 250,
                    maxHeight: 100,
                    minWidth: 150,
                    minHeight: 100
                  ),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/FlagNutrition/milk_animal.png',
                        width: 100,
                        height: 44,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'กลุ่มนม',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MilkMeatPage()));
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(3, 0, 0, 5),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(223, 170, 177, 1),
                      border: Border.all(width: 7, color: Colors.white)
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 150,
                    minHeight: 100
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/FlagNutrition/animal.png',
                        width: 120,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'เนื้อสัตว์',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
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

class FlagSectionVegFruit extends StatelessWidget {
  const FlagSectionVegFruit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 24,
      child: Row(
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VetFruitPage()));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 3, 5),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(195, 241, 142, 1),
                    border: Border.all(width: 7, color: Colors.white)),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '   ผัก ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/images/FlagNutrition/vegetable1.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VetFruitPage()));
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(3, 0, 0, 5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(194, 179, 244, 1),
                    border: Border.all(width: 7, color: Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/FlagNutrition/vegetable2.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'ผลไม้',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlagSectionFlour extends StatelessWidget {
  const FlagSectionFlour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RiceFlourPage()));
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(238, 215, 171, 1),
                      border: Border.all(color: Colors.white, width: 7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/FlagNutrition/flour.png',
                        width: 100,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        ' ข้าว-แป้ง ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/images/FlagNutrition/rice.png',
                        width: 100,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
