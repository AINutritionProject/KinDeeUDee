import 'package:flutter/material.dart';
import 'package:appfood2/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterSuccesPage extends StatelessWidget {
  const RegisterSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Success Page")),
      body: Align(
          alignment: Alignment.center,
          child: FaIcon(
            FontAwesomeIcons.circleCheck,
            
            color: Color.fromRGBO(65, 199, 175, 1),
            size: 210,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Auth().signOut();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
