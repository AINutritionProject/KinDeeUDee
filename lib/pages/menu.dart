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
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RealAllFoodPage(
                            type: "Fruit",
                          )));
                },
                icon: const Icon(Icons.tv)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const RealAllFoodPage(type: "Flour")));
                },
                icon: const Icon(Icons.tv)),
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
        body: Container(
          color: const Color.fromRGBO(234, 255, 241, 1),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 10, bottom: 24),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 212,
                        height: 41,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(91, 158, 130, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            )),
                        child: const Text(
                          "กลับสู่เมนูหลัก",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 32),
                child: Container(
                  width: double.infinity,
                  height: 53,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 160,
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
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
                              colorIcon: const Color.fromRGBO(167, 222, 189, 1),
                              imageAssetPath: "assets/images/Menu/fruit.png",
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RealAllFoodPage(type: "Fruit"),
                              ),
                            );
                          },
                          child: const MenuTypeIcon(
                            name: "ข้าวแป้ง",
                            color: Colors.white,
                            colorIcon: Color.fromRGBO(243, 222, 179, 1),
                            imageAssetPath: "assets/images/Menu/rice.png",
                          ),
                        )),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}

class MenuTypeIcon extends StatelessWidget {
  const MenuTypeIcon(
      {super.key,
      required this.name,
      required this.color,
      required this.imageAssetPath,
      required this.colorIcon});
  final String name;
  final Color color;
  final String imageAssetPath;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: colorIcon,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              Center(child: Image.asset(imageAssetPath)),
            ],
          )),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  String fullName = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter - tutorialkart.com'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                  onChanged: (text) {
                    setState(() {
                      fullName = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(fullName),
            )
          ]))),
    );
  }
}
