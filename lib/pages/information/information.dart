import 'package:appfood2/db.dart';
import 'package:flutter/material.dart';
import 'package:appfood2/pages/information/personal_information.dart';
import 'package:appfood2/pages/information/bmi.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                    MaterialPageRoute(builder: (context) => const BMIPage()));
              },
              icon: const Icon(Icons.light_sharp))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PersonalInformation(user: snapshot.data!);
            } else {
              return LoadingAnimationWidget.prograssiveDots(
                  color: Colors.black, size: 150);
            }
          },
          future: getUser(),
        ),
      ),
    );
  }
}
