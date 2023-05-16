import 'package:flutter/material.dart';
import 'package:appfood2/auth.dart';

class RegisterSuccesPage extends StatelessWidget {
  const RegisterSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Success Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Auth().signOut();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
