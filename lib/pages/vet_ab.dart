import 'package:appfood2/widgets/button_back.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/screen_size.dart';

class VetABPage extends StatelessWidget {
  const VetABPage({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    final double height = (type == "A" ? 900 : 1100);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              width: screenSizeData.screenSizeWidth,
              height: screenSizeData.screenHeight > height ? screenSizeData.screenHeight : height,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: type == "A" ? 2 : 2,
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: ButtonBack(
                                  colorCircle: Color.fromRGBO(130, 151, 223, 1),
                                  color: Colors.white,
                                )),
                          ),
                          type == "A"
                              ? const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ButtonVegA(),
                                  ))
                              : const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: ButtonVegB(),
                                  ))
                        ],
                      )),
                  Expanded(flex: type == "A" ? 10 : 12, child: ContainNameVeg(type: type, width: screenSizeData.screenSizeWidth,)),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class ContainNameVeg extends StatelessWidget {
  const ContainNameVeg({
    super.key,
    required this.type,
    required this.width,
  });

  final String type;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              child: type == "A" ? const DetailVeg() : const DetailVegB(),
            ),
          ),
          type == "A"
              ? Align(
                  alignment: const AlignmentDirectional(0, 0), child: BoxNameA(width: width,))
              : BoxNameB(width: width,)
        ],
      ),
    );
  }
}

class BoxNameA extends StatelessWidget {
  const BoxNameA({
    super.key,
    required this.width,
  });
  final double width;
  static const List<String> nameVegAL = [
    'ผักกาดขาว',
    'ผักแว่น',
    'ผักปวยเล้ง',
    'กะหล่ำปลี',
    'มะเขือเทศ',
    'แตงร้าน',
    'ฟักเขียว',
    'บวบ',
    'คูณ',
    'ผักกาดสลัด',
    'ผักกาดเขียว',
    'ยอดฟักทองอ่อน',
    'ดอกกะหล่ำ'
  ];
  static const List<String> nameVegAR = [
    'สายบัว',
    'ใบโหระพา',
    'คึ่นช่าย',
    'ขมิ้นขาว',
    'แตงโมอ่อน',
    'แฟง',
    'พริกหยวก',
    'หยวกกล้วยอ่อน',
    'แตงกวา',
    'น้ำเต้า',
    'พริกหนุ่ม',
    'ตั้งโอ๋',
    'ผักบุ้งแดง'
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration:
            const BoxDecoration(color: Color.fromRGBO(234, 255, 234, 1)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: nameVegAL
                  .map((e) => Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ))
                  .toList(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: nameVegAR
                  .map((e) => Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                        child: Text(
                          e,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxNameB extends StatelessWidget {
  const BoxNameB({
    super.key,
    required this.width,
  });
  final double width;
  static const List<String> nameVegBL = [
    "แครอท",
    "ถั่วงอก",
    'บีทรูท',
    'ยอดแค',
    'ยอดสะเดา',
    'ยอดผักกวางตุ้ง',
    'ใบกะเฉด',
    'ใบยอ',
    'ตะเกียงกะหล่ำ',
    'มะเขือเทศเสวย',
    'มะละกอดิบ',
    'เห็ดนางรม',
    'หอมหัวใหญ่',
    'ใบ-ดอกขี้เหล็ก',
    'ถั่วลันเตา'
        'ถั่วแขก',
    'ต้นกระเทียม',
    'มะระจีน',
    'เห็ดเป่าฮื้อ',
  ];
  static const List<String> nameVegBR = [
    "ยอดมะพร้าวอ่อน",
    "ดอกขจร",
    'พริกหวาน',
    'ผักคะน้า',
    'รากบัว',
    'บร๊อกโคลี่',
    'มะเขือกรอบ',
    'หน่อไม้ปี๊ป,ไผ่ตง',
    'สะตอ',
    'ผักหวาน',
    'ถั่วฝักยาว',
    'ถั่วพู',
    'ยอดชะอม',
    'ยอดกระถิน',
    'ดอกโสน'
        'ผักติ้ว',
    'ใบทองหลาง',
    'ข้าวโพดอ่อน',
    'ตำลึง',
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.05),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration:
              const BoxDecoration(color: Color.fromRGBO(251, 255, 234, 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nameVegBL
                    .map((e) => Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ))
                    .toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: nameVegBR
                    .map((e) => Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ))
                    .toList(),
              ),
            ],
          )
        ),
    );
  }
}

class DetailVeg extends StatelessWidget {
  const DetailVeg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'ผักที่ให้พลังงานน้อยมาก',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'รับประทานได้ตามต้องการ ดังนี้',
            style: TextStyle(fontSize: 30),
          )
        ]);
  }
}

class DetailVegB extends StatelessWidget {
  const DetailVegB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'ผักที่ให้พลังงานมีวิตามินและใย',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'อาหารสูงช่วยลดการดูดซึม',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'น้ำตาลและไขมันได้ ดังนี้',
            style: TextStyle(fontSize: 30),
          )
        ]);
  }
}

class ButtonVegA extends StatelessWidget {
  const ButtonVegA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(176, 243, 183, 1),
        boxShadow: const [
          BoxShadow(
              blurRadius: 0,
              color: Color.fromRGBO(141, 202, 147, 1),
              offset: Offset(7, -7),
              spreadRadius: 2.7)
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        'ผัก ก',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ButtonVegB extends StatelessWidget {
  const ButtonVegB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 239, 178, 1),
        boxShadow: const [
          BoxShadow(
              blurRadius: 0,
              color: Color.fromRGBO(216, 210, 148, 1),
              offset: Offset(7, -7),
              spreadRadius: 2.7)
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        'ผัก ข',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
    );
  }
}
