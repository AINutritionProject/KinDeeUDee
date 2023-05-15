import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/personal_information.dart';
import 'package:appfood2/pages/information/milk.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          )
        ],
      ),
      body: const Center(
        child: PersonalInformation(),
      ),
    );
  }
}
