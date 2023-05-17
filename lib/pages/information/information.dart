import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/personal_information.dart';
import 'package:appfood2/pages/information/milk.dart';
import 'package:appfood2/pages/information/bmi.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("InformationPage"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MilkPage(),
                ),
              );
            },
            icon: const Icon(Icons.ten_k),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BMIPage()));
              },
              icon: const Icon(Icons.light_sharp))
        ],
      ),
      body: const Center(
        child: PersonalInformation(),
      ),
    );
  }
}
