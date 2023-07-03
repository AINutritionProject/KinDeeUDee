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
                      child: const Text('ตรวจสอบอีเมลของคุณ')
                      ),
                      Container(
                        child: Text('5555555s'),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text('เปิดอีเมลของคุณ'),
                        ),
                      )

                  ],
                ),
                
                ),
                
           )
      );
  }
}