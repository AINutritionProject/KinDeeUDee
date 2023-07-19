import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/auth.dart';
import 'package:appfood2/pages/register_success.dart';
import 'package:appfood2/widgets/error_dialog.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool isEmailVerified = false;
  bool canResendEmail = true;
  final user = Auth().currentUser;
  late Timer timer;
  final int cooldownTime = 60;

  Future emailVerification() async {
    setState(() {
      isEmailVerified = Auth().emailIsVerified();
    });
  }

  void _showDialog(String errorCode) {
    String errorString = "พบปัญหาโปรดลองอีกครั้ง";
    if (errorCode == "too-many-requests") {
      errorString = "พบการส่งอีเมลซ้ำหลายครั้ง\nโปรดลองอีกครั้งในภายหลัง";
    }
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(errorString: errorString);
      },
    );
  }

  String _maskEmail(String email) {
    var nameuser = email.split("@")[0];
    if (nameuser.length <= 2) {
      return email;
    }
    var maskedEmail =
        email.replaceRange(2, nameuser.length, "*" * (nameuser.length - 2));
    return maskedEmail;
  }

  void _sendVerificationEmail() {
    print("กด");
    var result = Auth().sendVerificationEmail();
    result.then((errorCode) {
      if (errorCode != null) {
        _showDialog(errorCode);
      }
    });
  }

  @override
  void initState() {
    isEmailVerified = Auth().emailIsVerified();

    if (!isEmailVerified) {
      _sendVerificationEmail();
      canResendEmail = false;

      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        Auth().reloadUser().then((value) {
          setState(() {
            isEmailVerified = Auth().emailIsVerified();
          });

          if (isEmailVerified) {
            timer.cancel();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterSuccesPage(),
              ),
            );
          }
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 241, 238, 228),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.envelope,
              color: Colors.green,
              size: 150,
            ),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: const Text(
                  'ยืนยันอีเมลของคุณ',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                )),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width) *
                  0.2,
              child: Text(
                user != null
                    ? 'ส่งลิ้งยืนยันตัวตนไปที่ ${_maskEmail(user!.email!)}'
                    : "",
                style: const TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.041),
              margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width) *
                  0.25,
              child: Column(
                children: [
                  Builder(builder: (context) {
                    if (!canResendEmail) {
                      return Countdown(
                        seconds: cooldownTime,
                        onFinished: () {
                          setState(() {
                            canResendEmail = true;
                          });
                        },
                        build: (buildContext, time) => Text(
                          "ส่งอีกครั้งได้ใน ${time.toInt().toString()} วินาที",
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }
                    return const SizedBox(
                      height: 10,
                    );
                  }),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: canResendEmail
                            ? const Color.fromARGB(255, 238, 158, 93)
                            : Colors.grey,
                        minimumSize: const Size.fromHeight(70),
                        shadowColor: Colors.yellowAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    onPressed: () async {
                      if (canResendEmail) {
                        setState(() {
                          canResendEmail = false;
                        });
                        _sendVerificationEmail();
                        // **** start the timer ****
                      }
                    },
                    child: const Text(
                      'ส่งอีกครั้ง',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 7),
              child: TextButton(
                onPressed: () => Auth().signOut().then((value) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                }),
                child: const Text(
                  "ยกเลิก",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                    color: Color.fromARGB(255, 222, 158, 30),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
