import 'package:flutter/material.dart';
import 'package:appfood2/db.dart';
import 'bmi.dart';
import 'package:appfood2/screen_size.dart';

class MilkPage extends StatefulWidget {
  final User user;
  const MilkPage({
    super.key,
    required this.user,
  });

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  // ignore: non_constant_identifier_names
  bool status_milk0 = false;
  // ignore: non_constant_identifier_names
  bool status_milk1 = false;
  // ignore: non_constant_identifier_names
  bool status_milk2 = false;
  // ignore: non_constant_identifier_names
  bool status_eat0 = false;
  // ignore: non_constant_identifier_names
  bool status_eat1 = false;
  @override
  void initState() {
    if (widget.user.hasData) {
      if (widget.user.milkGlass == 0) {
        status_milk0 = true;
      } else if (widget.user.milkGlass == 1) {
        status_milk1 = true;
      } else if (widget.user.milkGlass == 2) {
        status_milk2 = true;
      }

      if (widget.user.milkProduct) {
        status_eat1 = true;
      } else {
        status_eat0 = true;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    final double fontSize = screenSizeData.screenSizeWidth < 600 ? 24 : 32;
    final double fontSizeTitle = screenSizeData.screenSizeWidth < 600 ? 24 : 28;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
        body: SafeArea(
          child: Container(
            height: screenSizeData.screenHeight,
            color: screenSizeData.screenWidth <= screenSizeData.maxWidth
                ? Colors.white
                : Colors.black,
            child: Center(
              child: Container(
                width: screenSizeData.screenSizeWidth,
                color: const Color.fromRGBO(255, 251, 242, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                          width: screenSizeData.screenSizeWidth * 0.8,
                          height: screenSizeData.screenSizeWidth * 0.22,
                          //width: double.infinity,
                          //padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                          //height: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(223, 230, 255, 1),
                              borderRadius: BorderRadius.circular(40)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "คุณดื่มนมหรือรับประทาน\nผลิตภัณฑ์จากนมหรือไม่?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSizeTitle,
                                    color:
                                        const Color.fromRGBO(106, 105, 141, 1)),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: screenSizeData.screenHeight * 0.05,
                            bottom: screenSizeData.screenHeight * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                                Image.asset(
                                    status_milk0? "assets/images/drink_eat/no_drink.png":"assets/images/drink_eat/drink.png",    
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.fitWidth,),
                                Image.asset(
                                    status_eat0? "assets/images/drink_eat/no_eat.png":"assets/images/drink_eat/eat.png",    
                                    height: 100,
                                    width: 170,
                                    fit: BoxFit.fitWidth,)
                                    ],
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            width: screenSizeData.screenSizeWidth * 0.3,
                            height: screenSizeData.screenSizeWidth * 0.1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: status_milk0
                                      ? const Color.fromRGBO(131, 255, 158, 1)
                                      : (!(status_milk0 ||
                                              status_milk1 ||
                                              status_milk2 ||
                                              status_eat0 ||
                                              status_eat1))
                                          ? const Color.fromRGBO(
                                              254, 194, 181, 1)
                                          : const Color.fromRGBO(
                                              206, 206, 206, 1),
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  )),
                              onPressed: () {
                                setState(
                                  () {
                                    status_milk0 = !status_milk0;
                                    status_milk1 = false;
                                    status_milk2 = false;
                                  },
                                );
                              },
                              child: Text("ไม่ดื่ม",
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                          SizedBox(
                            width: screenSizeData.screenSizeWidth * 0.3,
                            height: screenSizeData.screenSizeWidth * 0.1,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: status_eat0
                                        ? const Color.fromRGBO(131, 255, 158, 1)
                                        : (!(status_milk0 ||
                                                status_milk1 ||
                                                status_milk2 ||
                                                status_eat0 ||
                                                status_eat1))
                                            ? const Color.fromRGBO(
                                                254, 194, 181, 1)
                                            : const Color.fromRGBO(
                                                206, 206, 206, 1),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    )),
                                onPressed: () {
                                  setState(
                                    () {
                                      status_eat0 = !status_eat0;
                                      status_eat1 = false;
                                    },
                                  );
                                },
                                child: Text(
                                  "ไม่ทาน",
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: screenSizeData.screenSizeWidth * 0.3,
                            height: screenSizeData.screenSizeWidth * 0.1,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: status_milk1
                                        ? const Color.fromRGBO(131, 255, 158, 1)
                                        : (!(status_milk0 ||
                                                status_milk1 ||
                                                status_milk2 ||
                                                status_eat0 ||
                                                status_eat1))
                                            ? const Color.fromRGBO(
                                                226, 248, 255, 1)
                                            : const Color.fromRGBO(
                                                206, 206, 206, 1),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    )),
                                onPressed: () {
                                  setState(
                                    () {
                                      status_milk1 = !status_milk1;
                                      status_milk0 = false;
                                      status_milk2 = false;
                                    },
                                  );
                                },
                                child: Text(
                                  "1 แก้ว",
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                          SizedBox(
                            width: screenSizeData.screenSizeWidth * 0.3,
                            height: screenSizeData.screenSizeWidth * 0.1,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: status_eat1
                                        ? const Color.fromRGBO(131, 255, 158, 1)
                                        : (!(status_milk0 ||
                                                status_milk1 ||
                                                status_milk2 ||
                                                status_eat0 ||
                                                status_eat1))
                                            ? const Color.fromRGBO(
                                                253, 255, 164, 1)
                                            : const Color.fromRGBO(
                                                206, 206, 206, 1),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    )),
                                onPressed: () {
                                  setState(
                                    () {
                                      status_eat1 = !status_eat1;
                                      status_eat0 = false;
                                    },
                                  );
                                },
                                child: Text(
                                  "ทาน",
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: screenSizeData.screenSizeWidth * 0.3,
                            height: screenSizeData.screenSizeWidth * 0.1,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: status_milk2
                                        ? const Color.fromRGBO(131, 255, 158, 1)
                                        : (!(status_milk0 ||
                                                status_milk1 ||
                                                status_milk2 ||
                                                status_eat0 ||
                                                status_eat1))
                                            ? const Color.fromRGBO(
                                                226, 248, 255, 1)
                                            : const Color.fromRGBO(
                                                206, 206, 206, 1),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    )),
                                onPressed: () {
                                  setState(
                                    () {
                                      status_milk2 = !status_milk2;
                                      status_milk0 = false;
                                      status_milk1 = false;
                                    },
                                  );
                                },
                                child: Text(
                                  "2 แก้ว",
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                          Container(
                            width: screenSizeData.screenSizeWidth * 0.3,
                            height: screenSizeData.screenSizeWidth * 0.1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 251, 242, 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenSizeData.screenHeight * 0.05),
                      child: Visibility(
                          replacement: SizedBox(
                            height: screenSizeData.screenWidth < 600
                                ? screenSizeData.screenHeight * 0.075
                                : screenSizeData.screenHeight * 0.05,
                          ),
                          visible: ((status_eat0 || status_eat1) &&
                              (status_milk0 || status_milk1 || status_milk2)),
                          child: Container(
                            height: screenSizeData.screenWidth < 600
                                ? screenSizeData.screenHeight * 0.075
                                : screenSizeData.screenHeight * 0.05,
                            margin: EdgeInsets.symmetric(
                                horizontal:
                                    screenSizeData.screenSizeWidth * 0.38),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(135, 228, 234, 1),
                                    minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    )),
                                onPressed: () => {
                                      setState(() {
                                        if (status_milk0) {
                                          widget.user.milkGlass = 0;
                                        } else if (status_milk1) {
                                          widget.user.milkGlass = 1;
                                        } else if (status_milk2) {
                                          widget.user.milkGlass = 2;
                                        }
                                        if (status_eat0) {
                                          widget.user.milkProduct = false;
                                        } else if (status_eat1) {
                                          widget.user.milkProduct = true;
                                        }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => BMIPage(
                                                    user: widget.user)));
                                      })
                                    },
                                child: Text(
                                  "ถัดไป",
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
