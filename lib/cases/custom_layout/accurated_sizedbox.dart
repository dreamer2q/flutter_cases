import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AccuratedSizedBox extends SingleChildRenderObjectWidget {
  AccuratedSizedBox({
    Key? key,
    required Widget child,
    this.height = 0,
    this.width = 0,
  }) : super(key: key, child: child);

  final double height;
  final double width;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAccuratedSizedBox(width, height);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderAccuratedSizedBox renderObject,
  ) {
    renderObject
      ..width = width
      ..height = height;
  }
}

class RenderAccuratedSizedBox extends RenderProxyBoxWithHitTestBehavior {
  RenderAccuratedSizedBox(this.width, this.height);

  double width;
  double height;

  // 当前组件的大小只取决于父组件传递的约束
  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(Size(width, height));
  }

  // @override
  // void performResize() {
  //   // default behavior for subclasses that have sizedByParent = true
  //   size = computeDryLayout(constraints);
  //   assert(size.isFinite);
  // }

  @override
  void performLayout() {
    child!.layout(
      BoxConstraints.tight(
        Size(min(size.width, width), min(size.height, height)),
      ),
      parentUsesSize: false,
    );
  }
}
