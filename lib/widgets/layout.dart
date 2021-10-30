import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 420,
        ),
        child: child,
      ),
    );
  }
}
