import 'package:flutter/material.dart';
import 'package:appfood2/pages/menu.dart';
import 'package:appfood2/pages/flag_nutrition.dart';
import 'package:appfood2/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appfood2/pages/register_success.dart';
import 'package:appfood2/pages/eat_history.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _checkIfUserHasData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: user!.uid)
        .get();
    return userData.docs.first.get("hasData");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return const Home();
          } else {
            return const RegisterSuccesPage();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: _checkIfUserHasData(),
    );
  }
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
              icon: const Icon(Icons.tv))
        ],
      ),
      backgroundColor: Colors.yellow.shade50,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                UserAvatar(),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      "ยินต้อนรับ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '"คุณ บูม"',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MenuPage()));
              },
              child: MenuBlock(
                menuName: 'ค้นหาเมนู\n  อาหาร',
                innerColor: Colors.yellow.shade100,
                outerColor: Colors.greenAccent.shade100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EatHistoryPage()));
              },
              child: const MenuBlock(
                  menuName: 'ประวัติการรับประทานอาหาร',
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

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green.shade200,
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser?.photoURL ??
                    "https://avatars.githubusercontent.com/u/124413969?v=4"),
            radius: 60,
          ),
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
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: outerColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: innerColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              menuName,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
