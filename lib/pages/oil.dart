import 'package:flutter/material.dart';

class OilPage extends StatelessWidget {
  const OilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Oil Page")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
