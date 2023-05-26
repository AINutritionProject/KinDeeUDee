import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/information/information.dart';

class RegisterSuccesPage extends StatelessWidget {
  const RegisterSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Success Page")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 160),
            child: FaIcon(
              FontAwesomeIcons.circleCheck,
              color: Color.fromRGBO(65, 199, 175, 1),
              size: 190,
            ),
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
              padding: EdgeInsets.only(top: 50, left: 30, right: 30),
              child: SizedBox(
                  width: double.infinity,
                  height: 104,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(254, 158, 158, 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "กรอกข้อมูลส่วนตัว",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InformationPage()));
                },
                child: const FaIcon(FontAwesomeIcons.angleRight),
              )),
        ],
      ),
    );
  }
}
