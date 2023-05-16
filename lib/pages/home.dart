import 'package:flutter/material.dart';
import 'package:appfood2/pages/menu.dart';
import 'package:appfood2/pages/flag_nutrition.dart';
import 'package:appfood2/pages/eat_history.dart';
import 'package:appfood2/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () async {
                await Auth().signOut();
              },
              icon: Icon(Icons.sd))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MenuPage()));
              },
              child: const Stack(
                children: [
                  MenuBlock(
                    menuName: 'ค้นหาเมนู\n  อาหาร',
                    innerColor: Colors.yellow,
                    outerColor: Colors.greenAccent,
                  ),
                  Positioned(
                      top: -20,
                      right: 9,
                      child: Icon(
                        Icons.lightbulb,
                        size: 100,
                        color: Colors.yellow,
                      ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EatHistoryPage()));
              },
              child: const MenuBlock(
                  menuName: 'ประวัติการ\nรับประทานอาหาร',
                  innerColor: Colors.yellowAccent,
                  outerColor: Colors.red),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FlagNutrition()));
              },
              child: const MenuBlock(
                  menuName: 'ธงโภชนาการ',
                  innerColor: Colors.white,
                  outerColor: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuBlock extends StatelessWidget {
  const MenuBlock(
      {super.key, required this.menuName, this.innerColor, this.outerColor});
  final String menuName;
  final Color? innerColor;
  final Color? outerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: outerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          decoration: BoxDecoration(
            color: innerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            menuName,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
