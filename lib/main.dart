import 'package:appfood2/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/pages/login.dart';
import 'package:appfood2/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appfood2/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appfood2/screen_size.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "NotoSansThai"),
      initialRoute: "/welcome",
      routes: {
        "/welcome": (context) {
          return Container(
            color: screenSizeData.screenWidth <= screenSizeData.maxWidth
                ? Colors.white
                : Colors.black,
            child: Center(
                child: SizedBox(
                    width: screenSizeData.screenSizeWidth,
                    height: screenSizeData.screenHeight,
                    child: const WelcomePage())),
          );
        },
        "/landing": (context) => const LandingPage()
      },
    );
  }
}
