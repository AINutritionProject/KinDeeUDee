import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorDialog extends StatelessWidget {
  final String errorString;
  final String title;
  const ErrorDialog({
    super.key,
    required this.errorString,
    this.title = "พบข้อผิดพลาด",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child:
                FaIcon(FontAwesomeIcons.circleExclamation, color: Colors.red),
          ),
          Text(title),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Approve")),
      ],
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 150,
        child: Center(
          child: Text(errorString),
        ),
      ),
    );
  }
}
