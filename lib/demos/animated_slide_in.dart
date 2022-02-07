import 'package:flutter/material.dart';

import 'dart:math' as math;

class AnimatedSlideInPage extends StatelessWidget {
  const AnimatedSlideInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const duration = Duration(seconds: 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Slide In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.center,
        children: [
          Stack(
            children: [
              Transform.rotate(
                angle: (math.pi / 180) * 20,
                child: SlideInRibbon(
                  duration: duration,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              Transform.rotate(
                angle: (math.pi / 180) * -20,
                child: SlideInRibbon(
                  reverse: true,
                  duration: duration,
                  delay: duration,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SlideInRibbon extends StatefulWidget {
  const SlideInRibbon({
    Key? key,
    required this.child,
    this.height = 20,
    this.reverse = false,
    this.delay = const Duration(),
    this.duration = const Duration(milliseconds: 1000),
  }) : super(key: key);

  final Duration duration;
  final Duration delay;
  final bool reverse;
  final Widget child;
  final double height;

  @override
  State<SlideInRibbon> createState() => _SlideInRibbonState();
}

class _SlideInRibbonState extends State<SlideInRibbon>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animation = Tween<double>(
      begin: widget.reverse ? 1 : -1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInToLinear,
      ),
    );

    Future.delayed(widget.delay).then((_) {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = MediaQuery.of(context);
    final w = m.size.width;
    final d = (w + 100) / 5;
    return SizedBox(
      height: widget.height,
      child: OverflowBox(
        maxWidth: w + 110,
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Align(
              alignment: Alignment(
                d * animation.value,
                0,
              ),
              child: SizedBox(
                width: w + 100,
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}
