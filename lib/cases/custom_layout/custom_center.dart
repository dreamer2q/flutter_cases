import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCenter extends SingleChildRenderObjectWidget {
  const CustomCenter({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCenter();
  }
}

class RenderCustomCenter extends RenderShiftedBox {
  RenderCustomCenter({
    RenderBox? child,
  }) : super(child);

  @override
  void performLayout() {
    child!.layout(
      constraints.loosen(),
      parentUsesSize: true,
    );

    size = constraints.constrain(Size(
      constraints.maxWidth == double.infinity
          ? child!.size.width
          : double.infinity,
      constraints.maxHeight == double.infinity
          ? child!.size.height
          : double.infinity,
    ));

    final BoxParentData childParentData = child!.parentData! as BoxParentData;
    childParentData.offset = ((size - child!.size) as Offset) / 2;
  }
}
