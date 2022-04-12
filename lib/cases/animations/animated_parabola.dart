import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../main.dart';

class AnimatedParabolaPage extends StatefulWidget {
  const AnimatedParabolaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedParabolaPage> createState() => _AnimatedParabolaPageState();
}

class _AnimatedParabolaPageState extends State<AnimatedParabolaPage>
    with SingleTickerProviderStateMixin {
  late final animeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );

  late final Animation<Offset> _tween;

  @override
  void initState() {
    super.initState();

    final sz = MediaQuery.of(globalContext!).size;

    _tween = ParabolaTween(
      height: sz.height / 2,
      width: sz.width / 3,
    ).animate(
      CurvedAnimation(
        parent: animeController,
        curve: Curves.linear,
      ),
    );

    animeController.addListener(() {
      setState(() {});
    });

    Future.delayed(Duration.zero, () {
      animeController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parabola Move'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: _tween.value.dx,
            bottom: _tween.value.dy + 20,
            child: Container(
              width: 10,
              height: 10,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class ParabolaTween extends Tween<Offset> {
  ParabolaTween({
    required this.height,
    required this.width,
  }) : super(
          begin: Offset(0, 0),
          end: Offset(width, 0),
        ) {
    x0 = width / 2;
    k = (height / (x0 * x0));
  }

  final double height;
  final double width;
  late final double x0;
  late final double k;

  @override
  Offset lerp(double t) {
    // y = -kx^2 + h;
    final x = lerpDouble(0, width, t)!;
    final y = -k * pow(x - x0, 2) + height;
    return Offset(x, y);
  }
}
