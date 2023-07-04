import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/auth.dart';
import 'package:appfood2/pages/register_success.dart';
import 'package:appfood2/widgets/error_dialog.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool isEmailVerified = false;
  bool canResendEmail = true;
  late Timer timer;

  Future emailVerification() async {
    setState(() {
      isEmailVerified = Auth().emailIsVerified();
    });
  }

  void _showDialog(String errorCode) {
    String errorString = "พบปัญหาโปรดลองอีกครั้ง";
    if (errorCode == "too-many-requests") {
      errorString = "ส่งอีเมลซ้ำหลายครั้ง\nโปรดลองอีกครั้งในภายหลัง";
    }
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(errorString: errorString);
      },
    );
  }

  void _sendVerificationEmail() {
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

      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        Auth().reloadUser();
        setState(() {
          isEmailVerified = Auth().emailIsVerified();
        });

        if (isEmailVerified) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterSuccesPage(),
            ),
          );
          timer.cancel();
        }
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
              child: const Text(
                'เราจะส่งลิ้งยืนยันตัวตนไปที่อีเมลของท่าน',
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.041),
              margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width) *
                  0.25,
              child: ElevatedButton(
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
                    await Future.delayed(const Duration(seconds: 30));
                    setState(() {
                      canResendEmail = true;
                    });
                  }
                },
                child: const Text(
                  'ส่งอีกครั้ง',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 7),
              child: TextButton(
                onPressed: () => Auth().signOut(),
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

