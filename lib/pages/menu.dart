import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/information.dart';
import 'package:appfood2/pages/camera.dart';
import 'package:appfood2/pages/all_food.dart';
import 'package:appfood2/pages/information/information.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const CameraPage(replaceWhenNavigate: false)));
          },
          child: const Icon(
            Icons.camera_alt,
          ),
        ),
        appBar: AppBar(
          title: const Text("Find Menu"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InformationPage()));
              },
              child: const Text("information"),
            )
          ],
        ),
        body: Center(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const RealAllFoodPage(type: "Fruit"),
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const RealAllFoodPage(type: "Fruit")));
                    },
                    child: MenuTypeIcon(
                      name: "ผลไม้",
                      color: Colors.green.shade100,
                      imageAssetPath: "assets/images/Fruit/fruit2.png",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const RealAllFoodPage(type: "Flour"),
                      ),
                    );
                  },
                  child: MenuTypeIcon(
                    name: "ข้าวแป้ง",
                    color: Colors.yellow.shade300,
                    imageAssetPath: "assets/images/RiceFlour/Flour2.png",
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}

class MenuTypeIcon extends StatelessWidget {
  const MenuTypeIcon(
      {super.key,
      required this.name,
      required this.color,
      required this.imageAssetPath});
  final String name;
  final Color color;
  final String imageAssetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      margin: const EdgeInsets.only(left: 30, top: 30),
      padding: const EdgeInsets.all(10),
      height: 120,
      width: 160,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 48,
              top: 10,
              child: Container(
                decoration: BoxDecoration(color: color),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(child: Image.asset(imageAssetPath)),
          ],
        ),
      ),
    );
  }
}
