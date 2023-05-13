import 'package:flutter/material.dart';

class VetBPage extends StatelessWidget {
  const VetBPage({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(type == "A" ? "ผัก ก" : "ผัก ข")),
    );
  }
}
