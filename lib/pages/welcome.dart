import 'package:flutter/material.dart';
import 'package:appfood2/pages/landing.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.center,
      children: [
        const Positioned(
          top: 45,
          left: 130,
          child: Text(
            "กินดี",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Color.fromRGBO(71, 116, 70, 1),
            ),
          ),
        ),
        Positioned(
            top: 110,
            left: 110,
            child: Container(
              width: 155,
              alignment: Alignment.center,
              child: const Divider(
                thickness: 3,
                color: Colors.black,
              ),
            )),
        const Positioned(
          top: 105,
          left: 210,
          child: Text(
            "อยู่ดี",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Color.fromRGBO(250, 184, 124, 1)),
          ),
        ),
      ],
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 255, 231, 1),
        body: SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          children: [
            Expanded(
              flex: 33,
              child: Center(child: ImageLogo()),
            ),
            Expanded(
              flex: 34,
              child: Align(
                alignment: Alignment.center,
                child: AppLogo()),
            ),
            Expanded(
              flex: 34,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ButtonStart()),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ButtonStart extends StatelessWidget {
  const ButtonStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(156, 211, 101, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(156, 98),
          topRight: Radius.elliptical(165, 85),
          bottomLeft: Radius.elliptical(156, 98),
          bottomRight: Radius.elliptical(165, 85),
        )
      ),
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LandingPage()));
        },
        child: const Text(
          "เริ่มต้นใช้งาน",
          style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
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
          padding: const EdgeInsets.only(top: 25, left: 30),
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
                width: 90,
                height: 90,
              )
            ],
          ),
        )
      ],
    );
  }
}
