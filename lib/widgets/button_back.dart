import 'package:flutter/material.dart';
import 'package:appfood2/auth.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack(
      {super.key, this.sizeCircle, this.color, this.colorCircle, this.size,this.option='back'});

  final double? sizeCircle;
  final Color? colorCircle;
  final Color? color;
  final double? size;
  final String option ;

  @override
  Widget build(BuildContext context) {
    return option=='back'? InkWell(
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
    ): (option=='logout')? InkWell(
      onTap: () {
                  Auth().signOut().then((value) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
      child: Container(
        width: sizeCircle ?? 50,
        height: sizeCircle ?? 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(sizeCircle ?? 50),
            color: colorCircle ?? Colors.white),
        child: Icon(
          Icons.logout,
          size: size ?? 30,
          color: color ?? Colors.black,
        ),
      ),
    ):InkWell(
      onTap: () {
                  Auth().signOut().then((value) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
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
    );;
  }
}
