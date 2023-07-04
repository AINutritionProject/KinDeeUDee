import 'package:flutter/material.dart';
import 'create_newpassword.dart';
import '../widgets/button_back.dart';
import 'package:appfood2/screen_size.dart';


class RepassWord extends StatelessWidget {
  const RepassWord({super.key});

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
                    child:Container(
                color: const Color.fromARGB(255, 241, 238, 228),
                width: MediaQuery.of(context).size.width,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02,top: MediaQuery.of(context).size.height*0.02),
                          child:const ButtonBack(
                            colorCircle: Color.fromRGBO(130, 151, 223, 1),
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
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.2,top: MediaQuery.of(context).size.height*0.04),
                              child: const Text("ตั้งค่ารหัสผ่านใหม่",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700))),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.18,top: MediaQuery.of(context).size.height*0.02),
                              child: const Text("กรุณาใส่อีเมลของคุณ เราจะทำการส่งคำขอการตั้งรหัสผ่านใหม่ไปยังอีเมลของคุณ",style: TextStyle(fontSize: 18))
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.2,top: MediaQuery.of(context).size.height*0.03),
                              child: const Text("ที่อยู่อีเมล์",style: TextStyle(fontSize: 22))
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                          child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.grey),  
                            ),
                          ),
                                              ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05,top: MediaQuery.of(context).size.height*0.03),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 238, 158, 93),
                              minimumSize: const Size.fromHeight(70),
                              shadowColor: Colors.yellowAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                            ),
                            onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => const NewPassword()));},
                            child: const Text('ยืนยัน',style: TextStyle(fontSize: 24),),
                          ),
                        ),
                      ],
                    )
                  ],
                )
                )
            )
          ))));
    }
        )));
  }
}