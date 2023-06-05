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
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

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
  final String assetName = 'assets/icons/book-1.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Text("YEEEKAKA"),
            IconButton(
                onPressed: () async {
                  await Auth().signOut();
                },
                icon: Icon(Icons.logout))
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: HeaderSection(widget: widget),
            ),
            const Expanded(
              flex: 6,
              child: SectionButtonClick(),
            ),
            //
            const Expanded(
              flex: 1,
              child: FooterSection(),
            )
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
    );
  }
}

class SectionButtonClick extends StatelessWidget {
  const SectionButtonClick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Expanded(
                    flex: 38,
                    child: SearchMenuBox(),
                  ),
                  const Expanded(
                    flex: 36,
                    child: HistoryBox(),
                  ),
                  const Expanded(
                    flex: 30,
                    child: FlagNutritionBox(),
                  ),
                  Expanded(flex: 6, child: Container())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlagNutritionBox extends StatelessWidget {
  const FlagNutritionBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FlagNutrition()));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: MenuBlock(
                menuName: 'ธงโภชนาการ',
                innerColor: Colors.white,
                outerColor: Color.fromRGBO(197, 235, 246, 1),
                textColor: Color.fromRGBO(58, 0, 131, 1),
                //height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryBox extends StatelessWidget {
  const HistoryBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EatHistoryPage()));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: MenuBlock(
                menuName: 'ประวัติการ\nรับประทานอาหาร',
                innerColor: Color.fromRGBO(255, 238, 225, 1),
                outerColor: Color.fromRGBO(240, 164, 164, 1),
                //height: 150,
              ),
            ),
            Positioned(
              left: 70,
              top: 30,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/icons/book1.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchMenuBox extends StatelessWidget {
  const SearchMenuBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MenuPage()));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.center,
              child: MenuBlock(
                menuName: 'ค้นหาเมนู\nอาหาร',
                innerColor: Colors.yellow.shade100,
                outerColor: Colors.greenAccent.shade100,
                //height: 140,
              ),
            ),
            const Positioned(
              right: 10,
              bottom: 60,
              width: 150,
              height: 150,
              child: LamponTemplate(),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          const UserAvatar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'ยินต้อนรับ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '"${widget.username}"',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Builder(
            builder: (context) => Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => {
                  Scaffold.of(context).openDrawer(),
                },
                icon: const Icon(Icons.settings),
                iconSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LamponTemplate extends StatelessWidget {
  const LamponTemplate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 150, height: 150, child: LamponIcon());
  }
}

class LamponIcon extends StatelessWidget {
  const LamponIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Image.asset(
            'assets/icons/lampon.png',
            width: 70,
            height: 70,
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-0.6, -0.2),
          child: Transform.rotate(
            angle: -math.pi / 2,
            child: Container(
              width: 5,
              height: 15,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-0.45, -0.6),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Container(
              width: 5,
              height: 15,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -0.8),
          child: Transform.rotate(
            angle: -math.pi,
            child: Container(
              width: 5,
              height: 15,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.45, -0.6),
          child: Transform.rotate(
            angle: math.pi / 4,
            child: Container(
              width: 5,
              height: 15,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.6, -0.2),
          child: Transform.rotate(
            angle: -math.pi / 2,
            child: Container(
              width: 5,
              height: 15,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
      ],
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
    return Container(
      width: 130,
      height: 130,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(206, 255, 168, 1),
      ),
      child: GestureDetector(
        onTap: () async {
          await _updateProfilePicture();
          setState(() {});
        },
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: NetworkImage(FirebaseAuth
                        .instance.currentUser?.photoURL ??
                    "https://sp-ao.shortpixel.ai/client/to_auto,q_lossy,ret_img,w_1539,h_1069/https://h-o-m-e.org/wp-content/uploads/2022/04/Blank-Profile-Picture-1.jpg"),
                radius: 60,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1, 0.95),
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuBlock extends StatelessWidget {
  const MenuBlock(
      {super.key,
      required this.menuName,
      this.innerColor,
      this.outerColor,
      this.textColor,
      this.width,
      this.height});
  final String menuName;
  final Color? innerColor;
  final Color? outerColor;
  final Color? textColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width ?? 300,
        height: height ?? 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: outerColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: innerColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              menuName,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? const Color.fromRGBO(94, 36, 36, 1)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
