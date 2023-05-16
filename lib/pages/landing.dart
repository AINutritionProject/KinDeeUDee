import 'package:flutter/material.dart';
import 'package:appfood2/pages/login.dart';
import 'package:appfood2/pages/home.dart';
import 'package:appfood2/auth.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
      stream: Auth().authStateChanges,
    );
  }
}
