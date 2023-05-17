import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AIOutputPage extends StatelessWidget {
  const AIOutputPage({super.key, required this.foodImage});
  final XFile? foodImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(title: const Text("AI Output Page")),
    );
  }
}
