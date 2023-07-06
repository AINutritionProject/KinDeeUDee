import 'package:flutter/material.dart';
import '../widgets/button_back.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/auth.dart';

import '../widgets/error_dialog.dart';

class RepassWord extends StatefulWidget {
  const RepassWord({super.key});

  @override
  State<RepassWord> createState() => _RepassWordState();
}

class _RepassWordState extends State<RepassWord> {
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() {
    var result = Auth().resetPassword(_emailController.text.trim());
    result.then((errorCode) {
      if (errorCode != null) {
        var errorString = "พบปัญหาโปรดลองอีกครั้ง";
        if (errorCode == "invalid-email") {
          errorString = "อีเมลไม่ถูกต้อง";
        } else if (errorCode == "user-not-found") {
          errorString = "ไม่มีบัญชีผู้ใช้ถูกผูกกับอีเมลนี้";
        } else if (errorCode == "too-many-requests") {
          errorString =
              "พบการส่งอีเมลซ้ำหลายครั้ง\nบนเครื่องของคุณ\nโปรดลองอีกครั้งในภายหลัง";
        }

        showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(errorString: errorString);
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          height: screenSizeData.screenHeight,
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
              child: Container(
                  color: const Color.fromRGBO(255, 251, 242, 1),
                  width: screenSizeData.screenSizeWidth,
                  child: SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: Container(
                              color: const Color.fromARGB(255, 241, 238, 228),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        child: const ButtonBack(
                                          colorCircle:
                                              Color.fromRGBO(130, 151, 223, 1),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.04),
                                              child: const Text(
                                                  "ตั้งค่ารหัสผ่านใหม่",
                                                  style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.18,
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02),
                                              child: const Text(
                                                  "กรุณาใส่อีเมลของคุณ เราจะทำการส่งคำขอการตั้งรหัสผ่านใหม่ไปยังอีเมลของคุณ",
                                                  style:
                                                      TextStyle(fontSize: 20))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03),
                                              child: const Text("ที่อยู่อีเมล์",
                                                  style:
                                                      TextStyle(fontSize: 22))),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                        child: TextField(
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              borderSide: const BorderSide(
                                                  width: 2, color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 238, 158, 93),
                                              minimumSize:
                                                  const Size.fromHeight(70),
                                              shadowColor: Colors.yellowAccent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              )),
                                          onPressed: () {
                                            _resetPassword();
                                          },
                                          child: const Text(
                                            'ยืนยัน',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )))))));
    })));
  }
}
