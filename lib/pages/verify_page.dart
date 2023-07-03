import 'package:flutter/material.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(
            child: Container(
                color: Colors.amber[100],
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      child: const Text('ยืนยันอีเมลของคุณ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                      ),
                       Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width)*0.2,
                        child: const Text('ขอบคุณสำหรับการเข้าร่วมเป็นสมาชิก โปรดยืนยันตัวตนให้สำเร็จเพื่อเริ่มต้นใช้งาน'),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width)*0.15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size.fromHeight(50),),
                          onPressed: (){},
                          child: const Text('ยืนยันอีเมล'),
                        ),
                      )

                  ],
                ),
                
                ),
                
           )
      );
  }
}