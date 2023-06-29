import 'package:appfood2/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/db.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:appfood2/screen_size.dart';

class SaveDataSuccessPage extends StatelessWidget {
  final User user;
  final bool isConfig;
  const SaveDataSuccessPage({
    super.key,
    required this.user,
    this.isConfig = false,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    final double sizeFont = screenSizeData.screenSizeWidth < 600 ? 32 : 40;
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
                future: isConfig ? updateActivityDoc(user) : updateDoc(user),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == true) {
                      return Container(
                        color: screenSizeData.screenWidth <=
                                screenSizeData.maxWidth
                            ? Colors.white
                            : Colors.black,
                        child: Center(
                          child: Container(
                            color: Colors.white,
                            width: screenSizeData.screenSizeWidth,
                            height: screenSizeData.screenHeight,
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          screenSizeData.screenHeight * 0.05,
                                      top: screenSizeData.screenHeight * 0.25),
                                  child: const FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: Color.fromRGBO(65, 199, 175, 1),
                                    size: 190,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          screenSizeData.screenHeight * 0.05),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text("บันทึกสำเร็จ",
                                          style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  118, 183, 68, 1),
                                              fontSize: sizeFont,
                                              fontWeight: FontWeight.w600))),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LandingPage()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            178, 237, 255, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        )),
                                    child: Container(
                                      alignment: Alignment.center,
                                      //padding: const EdgeInsets.all(20),
                                      width: screenSizeData.screenSizeWidth <
                                              600
                                          ? screenSizeData.screenSizeWidth * 0.7
                                          : screenSizeData.screenSizeWidth *
                                              0.5,
                                      height: 80,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.arrow_circle_right_outlined,
                                            size: 49,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "เข้าสู่เมนูหลัก",
                                                style: TextStyle(
                                                    fontSize: sizeFont,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Text("Save to Firestore failed");
                    }
                  } else {
                    return Center(
                      child: LoadingAnimationWidget.prograssiveDots(
                          color: Colors.black, size: 150),
                    );
                  }
                })));
  }
}
