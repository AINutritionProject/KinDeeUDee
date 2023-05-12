import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InformationPage"),
      ),
      body: const Center(
        child: InformationStepper(),
      ),
    );
  }
}

class InformationStepper extends StatefulWidget {
  const InformationStepper({super.key});

  @override
  State<InformationStepper> createState() => _InformationStepperState();
}

class _InformationStepperState extends State<InformationStepper> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
