import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as math;

class Shaker extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double speed;
  final double range;
  const Shaker({
    super.key,
    required this.child,
    required this.duration,
    this.speed = 10,
    this.range = 25,
  });

  @override
  State<Shaker> createState() => ShakerState();
}

class ShakerState extends State<Shaker> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration, // how long the shake happens
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 00.0,
      end: 120.0,
    ).animate(animationController);
  }

  math.Vector3 _shake() {
    double progress = animationController.value;
    double offset = sin(
        progress * pi * widget.speed); // change 10 to make it vibrate faster
    return math.Vector3(
        offset * widget.range, 0.0, 0.0); // change 25 to make it vibrate wider
  }

  shake() {
    animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translation(_shake()),
      child: widget.child,
    );
  }
}
