import 'dart:async';

import 'package:appfood2/pages/information/activity_form.dart';
import 'package:appfood2/pages/information/information.dart';
import 'package:appfood2/pages/information/nutrition.dart';
import 'package:appfood2/pages/information/bmi.dart';
import 'package:appfood2/pages/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/pages/menu.dart';
import 'package:appfood2/pages/flag_nutrition.dart';
import 'package:appfood2/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appfood2/pages/register_success.dart';
import 'package:appfood2/pages/eat_history.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:appfood2/screen_size.dart';
import 'package:appfood2/db.dart' as db;

class Home extends StatefulWidget {
  final db.User user;
  const Home({
    super.key,
    required this.user,
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
  // Future<Map<String, dynamic>> _checkIfUserHasData() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final userData = await FirebaseFirestore.instance
  //       .collection("users")
  //       .where("uid", isEqualTo: user!.uid)
  //       .get();
  //   return {
  //     'hasData': userData.docs.first.get("hasData"),
  //     'username': userData.docs.first.get("username")
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (!Auth().emailIsVerified()) {
            return const VerifyPage();
          }
          if (snapshot.data?.hasData == true) {
            return Home(user: snapshot.data!);
          } else {
            return const RegisterSuccesPage();
          }
        } else if (snapshot.hasError) {
          return AlertDialog(
            actions: [
              TextButton(onPressed: () {}, child: const Text("go back"))
            ],
            content: const Text("ERRR"),
            title: const Text("Error naja"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: db.getUser(),
    );
  }
}

class _HomeState extends State<Home> {
  final String assetName = 'assets/icons/book-1.svg';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!widget.user.saveActivity &&
          DateTime.now().millisecondsSinceEpoch -
                  widget.user.activityInputTime >=
              const Duration(days: 7).inMilliseconds) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return WillPopScope(
                onWillPop: () => Future.value(false),
                child: AlertDialog(
                  title: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: FaIcon(FontAwesomeIcons.circleExclamation,
                            color: Colors.black38),
                      ),
                      Text(
                        "ข้อมูลกิจกรรม",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  actionsPadding: const EdgeInsets.only(right: 20, bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ActivityForm(
                                    user: widget.user,
                                    isConfig: true,
                                  )));
                        },
                        child: const Text(
                          "OK",
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                  content: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 140,
                    child: const Center(
                      child: Text(
                        "กรุณากรอกข้อมูลกิจกรรมประจำสัปดาห์ของท่าน",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );

    return Scaffold(
      endDrawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                width: screenSizeData.screenSizeWidth,
                color: Colors.amber[100],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.amber[500],
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_rounded),
                              ),
                              const Text(
                                'ย้อนกลับ',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const UserAvatar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        widget.user.username,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      widget.user.email,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Wrap(
                  runSpacing: 16,
                  children: [
                    // ListTile(
                    //   leading: const Icon(Icons.arrow_back_rounded),
                    //   title: const Text(
                    //     "ย้อนกลับ",
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    ListTile(
                      leading: Icon(Icons.assignment_ind_rounded,
                          size: 32, color: Colors.grey[700]),
                      title: const Text(
                        "แก้ไขข้อมูลส่วนตัว",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const InformationPage()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment_ind_rounded,
                          size: 32, color: Colors.grey[700]),
                      title: const Text(
                        "กิจกรรมประจำวันของฉัน",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ActivityForm(
                                user: widget.user, isConfig: true)));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment_ind_rounded,
                          size: 32, color: Colors.grey[700]),
                      title: const Text(
                        "ค่าดัชนีมวลกายของฉัน",
                        style: TextStyle(fontSize: 18),
                        //BMIPage
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BMIPage(
                                  user: widget.user,
                                  isDrawer: true,
                                )));
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.assignment_ind_rounded,
                        size: 32,
                        color: Colors.grey[700],
                      ),
                      title: const Text(
                        "ข้อมูลทางโภชนาการของฉัน",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Nutrition(user: widget.user, isDrawer: true)));
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined,
                    size: 32, color: Colors.grey[700]
                    //color: Colors.red[400],
                    ),
                title: const Text(
                  'ออกจากระบบ',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Auth().signOut().then((value) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
              )
            ],
          ),
        ),
      ),
      //backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
      body: SafeArea(
        child: Container(
          color: screenSizeData.screenWidth <= screenSizeData.maxWidth
              ? Colors.white
              : Colors.black,
          child: Center(
            child: Container(
              color: const Color.fromRGBO(255, 251, 242, 1),
              width: screenSizeData.screenSizeWidth,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: HeaderSection(widget: widget),
                  ),
                  Expanded(
                    flex: screenSizeData.screenWidth < 600 ? 6 : 3,
                    child: SectionButtonClick(
                      width: screenSizeData.screenSizeWidth,
                      height: screenSizeData.screenHeight,
                      user: widget.user,
                    ),
                  ),
                  //
                  const Expanded(
                    flex: 1,
                    child: FooterSection(),
                  )
                ],
              ),
            ),
          ),
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            color: const Color.fromRGBO(95, 206, 126, 0.65),
          ),
        ),
      ]),
    );
  }
}

class SectionButtonClick extends StatelessWidget {
  const SectionButtonClick(
      {super.key,
      required this.width,
      required this.height,
      required this.user});
  final double width;
  final double height;
  final db.User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: width < 600 ? 3 : 1,
                  child: const SizedBox(),
                ),
                Expanded(
                    flex: 20,
                    child: SearchMenuBox(
                      width: width,
                      height: height,
                      user: user,
                    )),
                Expanded(
                    flex: 18,
                    child: HistoryBox(
                      width: width,
                      height: height,
                    )),
                Expanded(
                    flex: 15,
                    child: FlagNutritionBox(width: width, height: height)),
                Expanded(
                  flex: width < 600 ? 2 : 15,
                  child: const SizedBox(),
                ),
              ],
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
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FlagNutrition()));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: MenuBlock(
                menuName: 'ธงโภชนาการ',
                innerColor: Colors.white,
                outerColor: const Color.fromRGBO(197, 235, 246, 1),
                textColor: const Color.fromRGBO(58, 0, 131, 1),
                width: width * 0.65,
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
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EatHistoryPage()));
      },
      child: SizedBox(
        width: width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: MenuBlock(
                menuName: 'ประวัติการ\nรับประทานอาหาร',
                innerColor: const Color.fromRGBO(255, 238, 225, 1),
                outerColor: const Color.fromRGBO(240, 164, 164, 1),
                width: width * 0.65,
              ),
            ),
            Positioned(
              left: width * 0.5 - 50 / 2 - (50 * 1.8),
              top: 30,
              child: Image.asset(
                'assets/icons/book1.png',
                width: 50,
                height: 50,
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchMenuBox extends StatelessWidget {
  const SearchMenuBox(
      {super.key,
      required this.width,
      required this.height,
      required this.user});
  final double width;
  final double height;
  final db.User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MenuPage(
                      user: user,
                    )));
      },
      child: SizedBox(
        width: width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.center,
              child: MenuBlock(
                menuName: 'ค้นหาเมนู\nอาหาร',
                innerColor: Colors.yellow.shade100,
                outerColor: Colors.greenAccent.shade100,
                height: 340,
                width: width * 0.65,
              ),
            ),
            Positioned(
                left: width * 0.5 - 150 / 2 + 150 - 40,
                bottom: 150 / 2 - (75 * 0.2),
                child: const LamponTemplate())
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
                'ยินดีต้อนรับ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '"${widget.user.username}"',
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
                  Scaffold.of(context).openEndDrawer(),
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
  late Timer a;
  @override
  void initState() {
    super.initState();
    // settime interval
    a = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    a.cancel();
  }

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
