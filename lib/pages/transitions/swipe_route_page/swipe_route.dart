import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class SwipePageContainer extends StatefulWidget {
  const SwipePageContainer({
    Key? key,
    required this.child,
    required this.pageBuilder,
  }) : super(key: key);

  final Widget child;
  final WidgetBuilder pageBuilder;

  @override
  State<SwipePageContainer> createState() => _SwipePageContainerState();
}

class _SwipePageContainerState extends State<SwipePageContainer>
    with SingleTickerProviderStateMixin {
  late HorizontalDragGestureRecognizer _recognizer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _recognizer = HorizontalDragGestureRecognizer(debugOwner: this)
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd
      ..onCancel = _handleDragCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Navigator;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        widget.child,
        ValueListenableBuilder<double>(
          valueListenable: _controller.view,
          builder: (context, value, child) {
            return value > 0 ? child! : SizedBox();
          },
          child: CupertinoPageTransition(
            primaryRouteAnimation: _controller,
            secondaryRouteAnimation: AlwaysStoppedAnimation(0),
            child: widget.pageBuilder(context),
            linearTransition: true,
          ),
        ),
        PositionedDirectional(
          top: 0,
          bottom: 0,
          width: 20,
          end: 0,
          child: Listener(
            onPointerDown: _handlePointerDown,
            behavior: HitTestBehavior.translucent,
          ),
        ),
      ],
    );
  }

  void _handlePointerDown(PointerDownEvent event) {
    debugPrint('_handlePointerDown: $event');
    _recognizer.addPointer(event);
  }

  void _handleDragStart(DragStartDetails details) {
    debugPrint('_handleDragStart: $details');
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    debugPrint('_handleDragUpdate: $details');
    final double v = details.primaryDelta! / context.size!.width;
    _controller.value -= v;
  }

  void _handleDragEnd(DragEndDetails details) {
    debugPrint('_handleDragEnd: $details');
    final double velocity =
        details.velocity.pixelsPerSecond.dx / context.size!.width;

    final bool animateForward;

    if (velocity.abs() >= 1.0) {
      animateForward = velocity <= 0;
    } else {
      animateForward = _controller.value > 0.5;
    }

    if (animateForward) {
      final int ms = min(lerpDouble(800, 0, _controller.value)!.floor(), 300);
      _controller.animateTo(1.0, duration: Duration(milliseconds: ms));
    } else {
      final int ms = lerpDouble(0, 800, _controller.value)!.floor();
      _controller.animateBack(0.0, duration: Duration(milliseconds: ms));
    }
  }

  void _handleDragCancel() {
    debugPrint('_handleDragCancel');
  }
}
