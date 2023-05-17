import 'package:flutter/material.dart';
import 'package:appfood2/pages/landing.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 700,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 175,
            left: 150,
            child: Text(
              "กินดี",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.green.shade900,
              ),
            ),
          ),
          const SizedBox(
            width: 150,
            child: Divider(
              thickness: 3,
              color: Colors.black,
            ),
          ),
          const Positioned(
            top: 225,
            left: 250,
            child: Text(
              "อยู่ดี",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFAFFE6),
        child: Column(
          children: [
            const ImageLogo(),
            const AppLogo(),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.elliptical(300, 150))),
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LandingPage()));
                },
                child: const Text(
                  "เริ่มต้นใช้งาน",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageLogo extends StatelessWidget {
  const ImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Image.asset(
            "assets/images/logo_NRCT.jpg",
            width: 70,
            height: 70,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ku.png",
                width: 60,
                height: 60,
              ),
              Image.asset(
                "assets/images/kku.png",
                width: 60,
                height: 60,
              ),
              Image.asset(
                "assets/images/mahidol.png",
                width: 60,
                height: 60,
              )
            ],
          ),
        )
      ],
    );
  }
}
