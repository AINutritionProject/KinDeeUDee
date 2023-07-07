import 'package:flutter/material.dart';
import '../widgets/button_back.dart';
import 'package:appfood2/screen_size.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool isObscure1 = true;
  bool isObscure2= true;
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
                      child:   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02,top: MediaQuery.of(context).size.height*0.02),
                              child:const ButtonBack(
                                colorCircle: Color.fromARGB(255, 238, 158, 93),
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
                                  child: const Text("สร้างรหัสผ่านใหม่",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700))),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.1,top: MediaQuery.of(context).size.height*0.02),
                                  child: const Text("รหัสผ่านใหม่ของคุณต้องมีความยาว 8-16 ตัวอักษรและมีทั้งตัวอักษรพิมพ์ใหญ่ ตัวพิมพ์เล็ก และตัวเลข",style: TextStyle(fontSize: 18))
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.2,top: MediaQuery.of(context).size.height*0.03),
                                  child: const Text("รหัสผ่าน",style: TextStyle(fontSize: 22))
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                              child: TextField(
                              style: const TextStyle(fontSize: 23),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.grey),  
                                ),
                                suffixIcon: IconButton(
                                icon: Icon(isObscure1
                                ? Icons.visibility_off
                                // ignore: dead_code
                                : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isObscure1 = !isObscure1;
                                  });
                                }),
                              ),
                              obscureText:isObscure1
                                                  ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.2,top: MediaQuery.of(context).size.height*0.03),
                                  child: const Text("ยืนยันรหัสผ่าน",style: TextStyle(fontSize: 22))
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
                              child: TextField(
                              style: const TextStyle(fontSize: 23),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.grey),  
                                ),
                                suffixIcon: IconButton(
                                icon: Icon(isObscure2
                                ? Icons.visibility_off
                                // ignore: dead_code
                                : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isObscure2 = !isObscure2;
                                  });
                                }),
                              ),
                              obscureText:isObscure2
                                                  ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05,top: MediaQuery.of(context).size.height*0.03),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 238, 158, 93),
                                  minimumSize: const Size.fromHeight(65),
                                  shadowColor: Colors.yellowAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  )
                                ),
                                onPressed: (){},
                                child: const Text('ยืนยัน',style: TextStyle(fontSize: 24),),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ))),
            ));
  })
            )
          );
  }
}