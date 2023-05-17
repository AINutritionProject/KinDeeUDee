import 'package:flutter/material.dart';

class AddEatHistoryPage extends StatefulWidget {
  const AddEatHistoryPage({super.key});

  @override
  State<AddEatHistoryPage> createState() => _AddEatHistoryPageState();
}

class _AddEatHistoryPageState extends State<AddEatHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add eat history page")),
    );
  }
}
