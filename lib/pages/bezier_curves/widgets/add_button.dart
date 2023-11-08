import 'package:flutter/material.dart';

import 'animated_dot.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    Key? key,
    required this.onPressed,
    required this.endOffset,
    this.duration = const Duration(milliseconds: 800),
  }) : super(key: key);

  final VoidCallback onPressed;
  final Offset Function() endOffset;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final _entry = OverlayEntry(
          builder: (_) {
            final box = context.findRenderObject() as RenderBox;
            final offset = box.localToGlobal(Offset.zero);
            return RedDotAnimatedWidget(
              startPosition: offset,
              endPosition: endOffset(),
              duration: duration,
            );
          },
        );
        Overlay.of(context).insert(_entry);
        Future.delayed(duration).then((_) => _entry.remove());
        onPressed.call();
      },
      icon: const Icon(
        Icons.add_shopping_cart,
        color: Colors.green,
      ),
    );
  }
}
