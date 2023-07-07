import 'package:appfood2/auth.dart';
import 'package:appfood2/db.dart';
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/widgets/button_back.dart';
import 'package:appfood2/widgets/shaker.dart';
import 'package:appfood2/pages/verify_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../widgets/error_dialog.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
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
                    child: const RegisterForm(),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Future<void> _onRegistry() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Future<String?> result = Auth().createUserWithEmailAndPassword(
      _usernameController.text,
      _passwordController.text,
      _phoneNumberController.text,
      _emailController.text,
    );

    result.then((errorCode) {
      if (errorCode != null) {
        print("Value :$errorCode");
        var errorString = "พบปัญหาโปรดลองอีกครั้ง";
        if (errorCode == "email-already-in-use") {
          errorString = "อีเมลนี้ถูกใช้สมัครไปแล้ว";
        } else if (errorCode == "invalid-email") {
          errorString = "ไม่ใช่ที่อยู่อีเมลที่ถูกต้อง";
        } else if (errorCode == "weak-password") {
          errorString =
              "พาสเวิร์ดไม่ปลอดถัยมากพอ\nต้องมีความยาวอย่างน้อย 6 ตัวอักษร";
        }
        showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(errorString: errorString);
          },
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const VerifyPage(),
          ),
        );
      }
    });
  }

  bool? isAccept = false;
  bool checkboxError = false;
  List<String> usernames = [];
  List<String> emails = [];
  final GlobalKey<ShakerState> _shakeKey = GlobalKey<ShakerState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUsernamesAndEmails(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            usernames = asyncSnapshot.data!["usernames"]!;
            emails = asyncSnapshot.data!["emails"]!;
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 30, bottom: 30),
                    child: ButtonBack(
                      colorCircle: Color(0xFF09B7AD),
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          child: Text(
                            "ลงทะเบียน",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w700),
                          ))),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          child: Text(
                            "กรุณากรอกข้อมูลให้ครบถ้วน",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(35, 126, 132, 1)),
                          ))),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 12.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(174, 254, 196, 0.65),
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 30),
                          child: TextFormSlot(
                              controller: _emailController,
                              name: "อีเมล",
                              validator: (String? val) {
                                if (val != null) {
                                  String text = val.trim();
                                  if (text.isEmpty) {
                                    return "กรุณากรอกอีเมลของท่าน";
                                  } else if (!EmailValidator.validate(text)) {
                                    return "กรุณากรอกรูปแบบอีเมลให้ถูกต้อง";
                                  } else if (emails.contains(text)) {
                                    return "อีเมลนี้ถูกใช้ในการสมัครไปแล้ว โปรดใช้อีเมลอื่น";
                                  }
                                }
                                return null;
                              }),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormSlot(
                              controller: _phoneNumberController,
                              name: "หมายเลขโทรศัพท์",
                              validator: _phoneValidator,
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 30),
                            child: TextFormSlot(
                                controller: _usernameController,
                                name: "ชื่อผู้ใช้",
                                validator: (String? val) {
                                  if (val != null) {
                                    String text = val.trim();
                                    if (text.isEmpty) {
                                      return "กรุณากรอกชื่อผู้ใช้ของท่าน";
                                    } else if (text.contains(" ")) {
                                      return "ชื่อผู้ใช้ต้องไม่มีช่องว่าง";
                                    } else if (text.contains(
                                        RegExp('[^A-Za-z\u0E00-\u0E7F_0-9]'))) {
                                      return "ชื่อผู้ใช้ต้องไม่มีตัวอักษรพิเศษอื่นนอกจาก \"_\"";
                                    } else if (!text.contains(
                                        RegExp('^[A-Za-z\u0E00-\u0E7F]'))) {
                                      return "ชื่อผู้ใช้ต้องขึ้นต้นด้วยตัวอักษรธรรมดาเท่านั้น";
                                    } else if (text.length > 15) {
                                      return "ชื่อผู้ใช้ต้องมีความยาวไม่เกิน 15 ตัวอักษร";
                                    } else if (usernames.contains(text)) {
                                      return "ชื่อผู้ใช้นี้ถูกใช้ไปแล้ว โปรดเลือกชื่อผู้ใช้อื่น";
                                    }
                                  }
                                  return null;
                                })),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: TextFormSlot(
                              controller: _passwordController,
                              name: "รหัสผ่าน",
                              validator: _passwordValidator,
                              hidden: true,
                            )),
                        Row(
                          children: [
                            Shaker(
                              key: _shakeKey,
                              speed: 8,
                              duration: const Duration(milliseconds: 500),
                              range: 5,
                              child: Checkbox(
                                  side: !checkboxError
                                      ? const BorderSide(
                                          color: Colors.black38, width: 2)
                                      : const BorderSide(
                                          color: Colors.red, width: 2),
                                  value: isAccept,
                                  activeColor: Colors.blue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkboxError = false;
                                      isAccept = newValue;
                                    });
                                  }),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.93,
                                          child: Column(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 40, bottom: 10),
                                                child: Text(
                                                  "นโยบายความเป็นส่วนตัว",
                                                  style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.75,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromRGBO(
                                                            255, 251, 236, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                    child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            top: 20,
                                                            bottom: 20),
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20,
                                                                right: 20),
                                                        child: SfPdfViewer.asset(
                                                            "assets/documents/appfood_privacy_policy.pdf")),
                                                  ))
                                            ],
                                          ));
                                    });
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: const Text(
                                    "ฉันยอมรับข้อตกลงและเงื่อนไข นโยบายความเป็นส่วนตัว",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                  )),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: FaIcon(
                                  FontAwesomeIcons.circleQuestion,
                                  color: Colors.blue,
                                  size: 13,
                                )),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 84, vertical: 30),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(9, 183, 168, 1),
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                minimumSize: const Size(
                                    double.infinity, 54), //////// HERE
                              ),
                              onPressed: () {
                                if (isAccept != null && isAccept!) {
                                  _onRegistry();
                                } else {
                                  setState(() {
                                    _shakeKey.currentState?.shake();
                                    checkboxError = true;
                                    _formKey.currentState?.validate();
                                  });
                                }
                              },
                              child: const Text(
                                'ลงทะเบียน',
                                style: TextStyle(fontSize: 30),
                              ),
                            ))
                      ])),
                ],
              ),
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.black, size: 150),
            );
          }
        });
  }
}

class TextFormSlot extends StatefulWidget {
  const TextFormSlot(
      {super.key,
      required this.controller,
      required this.name,
      required this.validator,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.hidden = false});
  final TextEditingController controller;
  final String name;
  final String? Function(String? val) validator;
  final AutovalidateMode autovalidateMode;
  final bool hidden;

  @override
  State<TextFormSlot> createState() => _TextFormSlotState();
}

class _TextFormSlotState extends State<TextFormSlot> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          style: const TextStyle(fontSize: 23),
          decoration: widget.hidden
              ? InputDecoration(
                  // this button is used to toggle the password visibility
                  errorStyle: const TextStyle(fontSize: 18, color: Colors.red),
                  errorMaxLines: 2,
                  suffixIcon: IconButton(
                      icon: Icon(isObscure
                          ? Icons.visibility_off
                          // ignore: dead_code
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      }))
              : const InputDecoration(
                  errorStyle: TextStyle(fontSize: 18, color: Colors.red),
                  errorMaxLines: 2,
                ),
          obscureText: widget.hidden && (isObscure) ? true : false,
        ),
      ],
    );
  }
}

String? _phoneValidator(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกเบอร์โทรศัพท์ของท่าน";
    } else if (text.contains(RegExp(r'\D'))) {
      return "กรุณากรอกเพียงตัวเลข";
    } else if (!text.contains(RegExp(r'^0')) ||
        (text.length != 9 && text.length != 10)) {
      return "กรุณากรอกด้วยรูปแบบที่ถูกต้อง";
    }
  }
  return null;
}

String? _passwordValidator(String? val) {
  if (val != null) {
    String text = val.trim();
    if (text.isEmpty) {
      return "กรุณากรอกรหัสผ่านของท่าน";
    } else if (text.contains(" ")) {
      return "รหัสผ่านต้องไม่มีช่องว่าง";
    } else if (text.length <= 6) {
      return "รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร";
    }
  }
  return null;
}
