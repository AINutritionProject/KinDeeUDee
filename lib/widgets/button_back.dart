import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack(
      {super.key, this.sizeCircle, this.color, this.colorCircle, this.size});

  final double? sizeCircle;
  final Color? colorCircle;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Navigator.pop(context)},
      child: Container(
        width: sizeCircle ?? 50,
        height: sizeCircle ?? 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizeCircle ?? 50),
            color: colorCircle ?? Colors.white),
        child: Icon(
          Icons.chevron_left,
          size: size ?? 45,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
