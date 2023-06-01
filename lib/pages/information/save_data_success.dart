import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appfood2/pages/home.dart';
import 'package:appfood2/db.dart';

class SaveDataSuccessPage extends StatelessWidget {
  final User user;
  const SaveDataSuccessPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
                future: updateDoc(user.uid, user),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Column(
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
                              child: Text("บันทึกสำเร็จ",
                                  style: TextStyle(
                                      color: Color.fromRGBO(118, 183, 68, 1),
                                      fontSize: 35,
                                      fontWeight: FontWeight.w600)))),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 53, right: 30),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(178, 237, 255, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                )),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 80,
                              child: const Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.arrow_circle_right_outlined,
                                        size: 49,
                                      )),
                                  Expanded(
                                    flex: 6,
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "เข้าสู่เมนูหลัก",
                                            style: TextStyle(
                                                fontSize: 36,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  );
                })));
  }
}
