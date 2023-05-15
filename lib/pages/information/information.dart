import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/personal_information.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("InformationPage"),
      ),
      body: const Center(
        child: PersonalInformation(),
      ),
    );
  }
}
