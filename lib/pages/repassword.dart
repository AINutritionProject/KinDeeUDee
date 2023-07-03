import 'package:flutter/material.dart';
import 'create_newpassword.dart';
import '../widgets/button_back.dart';
 

class RepassWord extends StatelessWidget {
  const RepassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(
            child: Container(
                color: const Color.fromARGB(255, 241, 238, 228),
                width: MediaQuery.of(context).size.width,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        ButtonBack(
                          colorCircle: Color.fromRGBO(130, 151, 223, 1),
                          color: Colors.white,
                          ),
                      ],
                      
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.2),
                              child: const Text("ตั้งค่ารหัสผ่านใหม่")),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.2),
                              child: const Text("กรุณาใส่อีเมลของคุณ เราจะทำการส่งคำขอการตั้งรหัสผ่านใหม่ไปยังอีเมลของคุณ")
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.2),
                              child: const Text("ที่อยู่อีเมล์")
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                          child: const TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.grey), //<-- SEE HERE
                            ),
                          ),
                                              ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 238, 158, 93),
                              minimumSize: const Size.fromHeight(70),
                              shadowColor: Colors.yellowAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                            ),
                            onPressed: (){MaterialPageRoute(builder: (context) => const NewPassword());},
                            child: const Text('ยืนยัน',style: TextStyle(fontSize: 24),),
                          ),
                        ),
                      ],
                    )
                  ],
                )
                )
            )
          );
  }
}