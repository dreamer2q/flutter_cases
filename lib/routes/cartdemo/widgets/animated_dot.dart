import 'dart:math';

import 'package:flutter/material.dart';

class RedDotAnimatedWidget extends StatefulWidget {
  const RedDotAnimatedWidget({
    Key? key,
    required this.startPosition,
    required this.endPosition,
    required this.duration,
  }) : super(key: key);

  final Offset startPosition;
  final Offset endPosition;
  final Duration duration;

  @override
  _RedDotAnimatedWidgetState createState() => _RedDotAnimatedWidgetState();
}

class _RedDotAnimatedWidgetState extends State<RedDotAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset get currentOffset {
    final t = _animation.value;
    final x0 = widget.startPosition.dx;
    final y0 = widget.startPosition.dy;
    final x1 = widget.startPosition.dx - 250;
    final y1 = widget.startPosition.dy - 100;
    final x2 = widget.endPosition.dx;
    final y2 = widget.endPosition.dy;
    final left = pow(1 - t, 2) * x0 + 2 * t * (1 - t) * x1 + pow(t, 2) * x2;
    final top = pow(1 - t, 2) * y0 + 2 * t * (1 - t) * y1 + pow(t, 2) * y2;
    return Offset(left, top);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (_, child) {
            final offset = currentOffset;
            return Positioned(
              left: offset.dx,
              top: offset.dy,
              child: child!,
            );
          },
          child: ClipOval(
            child: Container(
              width: 14,
              height: 14,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
