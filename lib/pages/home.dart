import 'package:flutter/material.dart';
import 'package:appfood2/pages/menu.dart';
import 'package:appfood2/pages/flag_nutrition.dart';
import 'package:appfood2/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appfood2/pages/register_success.dart';
import 'package:appfood2/pages/eat_history.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  final String username;
  const Home({
    super.key,
    required this.username,
  });

  @override
  State<Home> createState() => _HomeState();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>> _checkIfUserHasData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: user!.uid)
        .get();
    return {
      'hasData': userData.docs.first.get("hasData"),
      'username': userData.docs.first.get("username")
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?['hasData'] == true) {
            //TODO:check that map value is not null
            return Home(username: snapshot.data?['username']);
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
            Row(
              children: [
                const UserAvatar(),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    const Text(
                      "ยินต้อนรับ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.username,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
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
                  innerColor: Color.fromRGBO(255, 238, 225, 1),
                  outerColor: Color.fromRGBO(240, 164, 164, 1)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FlagNutrition()));
              },
              child: const MenuBlock(
                  menuName: 'ธงโภชนาการ',
                  innerColor: Colors.white,
                  outerColor: Color.fromRGBO(197, 235, 246, 1)),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatefulWidget {
  const UserAvatar({
    super.key,
  });

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  Future<void> _updateProfilePicture() async {
    final picker = ImagePicker();
    final filename = FirebaseAuth.instance.currentUser!.uid;
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    // get storage reference
    final ref = FirebaseStorage.instance.ref().child("profile_pictures");
    // upload file to storage
    await ref.child(filename).putFile(File(pickedFile.path));
    // get url
    final url = await ref.child(filename).getDownloadURL();
    // update user profile
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
  }

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
        child: GestureDetector(
          onTap: () async {
            await _updateProfilePicture();
            setState(() {});
          },
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundImage: NetworkImage(FirebaseAuth
                      .instance.currentUser?.photoURL ??
                  "https://www.wycliffe.ca/wp-content/uploads/2021/03/member-fallback-user-image.png"),
              radius: 60,
            ),
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
