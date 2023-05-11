import 'package:flutter/material.dart';
import 'package:appfood2/pages/camera.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CameraPage()));
          },
          child: const Icon(
            Icons.camera_alt,
          ),
        ),
        appBar: AppBar(
          title: const Text("Find Menu"),
        ),
        body: const Center(
          child: Text("MenuPage"),
        ));
  }
}
