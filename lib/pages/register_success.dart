import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/information/information.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/widgets/button_back.dart';

class RegisterSuccesPage extends StatelessWidget {
  const RegisterSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenSizeData.screenHeight,
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: Container(
              width: screenSizeData.screenSizeWidth,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      children: [
                        ButtonBack(
                            colorCircle: Color.fromRGBO(130, 151, 223, 1),
                            color: Colors.white,
                            option: 'logout')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryData.size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: Color.fromRGBO(65, 199, 175, 1),
                          size: 190,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("ลงทะเบียนสำเร็จ",
                                    style: TextStyle(
                                        color: Color.fromRGBO(118, 183, 68, 1),
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600)))),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 50, left: 30, right: 30),
                            child: SizedBox(
                                width: double.infinity,
                                height: 104,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(254, 158, 158, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "กรอกข้อมูลส่วนตัว",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const InformationPage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(
                                          174, 144, 144, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      )),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 80,
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const InformationPage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 45,
                                    height: 65,
                                  )),
                              IconButton(
                                  padding: const EdgeInsets.only(),
                                  alignment: Alignment.center,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.angleRight,
                                    size: 45,
                                    color: Color.fromRGBO(174, 144, 144, 1),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const InformationPage()));
                                  })
                            ])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
