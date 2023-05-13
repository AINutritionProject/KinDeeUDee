import 'package:flutter/material.dart';
import 'package:appfood2/pages/login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPage(),
    );
  }
}
