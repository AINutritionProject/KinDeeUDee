import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/auth.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

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
                    backgroundColor: const Color.fromARGB(255, 238, 158, 93),
                    minimumSize: const Size.fromHeight(70),
                    shadowColor: Colors.yellowAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                onPressed: () {},
                child: const Text(
                  'ส่งอีกครั้ง',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

