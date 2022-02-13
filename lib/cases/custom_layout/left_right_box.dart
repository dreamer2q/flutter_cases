import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class LeftRightBox extends MultiChildRenderObjectWidget {
  LeftRightBox({
    Key? key,
    required List<Widget> children,
  })  : assert(children.length == 2, "only 2 children"),
        super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderLeftRight();
  }
}

class LeftRightParentData extends ContainerBoxParentData<RenderBox> {}

class RenderLeftRight extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, LeftRightParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, LeftRightParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! LeftRightParentData) {
      child.parentData = LeftRightParentData();
    }
  }

  @override
  void performLayout() {
    RenderBox leftChild = firstChild!;
    LeftRightParentData childParentData =
        leftChild.parentData! as LeftRightParentData;

    RenderBox rightChild = childParentData.nextSibling!;

    rightChild.layout(
      constraints.copyWith(
        maxWidth: constraints.maxWidth / 2,
      ),
      parentUsesSize: true,
    );

    childParentData = rightChild.parentData! as LeftRightParentData;
    childParentData.offset =
        Offset(constraints.maxWidth - rightChild.size.width, 0);

    leftChild.layout(
      constraints.copyWith(
        maxWidth: constraints.maxWidth - rightChild.size.width,
        minWidth: 0,
      ),
      parentUsesSize: true,
    );

    size = Size(
      constraints.maxWidth,
      math.max(leftChild.size.height, rightChild.size.height),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(
    BoxHitTestResult result, {
    required Offset position,
  }) {
    return defaultHitTestChildren(result, position: position);
  }
}
