import 'package:flutter/material.dart';

class VetABPage extends StatelessWidget {
  const VetABPage({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(type == "A" ? "ผัก ก" : "ผัก ข"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: type == "A" ? const ButtonVegA() : const ButtonVegB()),
              ContainNameVeg(type: type)
            ],
          ),
        ));
  }
}

class ContainNameVeg extends StatelessWidget {
  const ContainNameVeg({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: type == "A" ? 700 : 900,
      
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0, -0.99),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: type == "A" ? const DetailVeg() : const DetailVegB(),
            ),
          ),
          type == "A" ? const BoxNameA() : const BoxNameB()
        ],
      ),
    );
  }
}

class BoxNameA extends StatelessWidget {
  const BoxNameA({
    super.key,
  });
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
      alignment: const AlignmentDirectional(0, 0.55),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.86,
          height: MediaQuery.of(context).size.height * 0.62,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(234, 255, 234, 1)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: nameVegAL
                      .map((e) => Padding(
                            padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: nameVegAR
                      .map((e) => Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                        child: Text(
                              e,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              //textAlign: TextAlign.start,
                            ),
                      ))
                      .toList(),
                ),
              ),
            ],
          )),
    );
  }
}

class BoxNameB extends StatelessWidget {
  const BoxNameB({
    super.key,
  });
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
      alignment: const AlignmentDirectional(0, 0.45),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.86,
          height: MediaQuery.of(context).size.height * 0.84,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(251, 255, 234, 1)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: nameVegBL
                      .map((e) => Padding(
                            padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: nameVegBR
                      .map((e) => Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 0, 0),
                        child: Text(
                              e,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              //textAlign: TextAlign.start,
                            ),
                      ))
                      .toList(),
                ),
              ),
            ],
          )),
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
              fontSize: 24,
            ),
          ),
          Text(
            'รับประทานได้ตามต้องการ ดังนี้',
            style: TextStyle(fontSize: 24),
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
              fontSize: 24,
            ),
          ),
          Text(
            'อาหารสูงช่วยลดการดูดซึม',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'น้ำตาลและไขมันได้ ดังนี้',
            style: TextStyle(fontSize: 24),
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
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.092,
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
        child: const Align(
          alignment: AlignmentDirectional(0, -0.35),
          child: Text(
            'ผัก ก',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
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
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.092,
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
        child: const Align(
          alignment: AlignmentDirectional(0, -0.35),
          child: Text(
            'ผัก ข',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
