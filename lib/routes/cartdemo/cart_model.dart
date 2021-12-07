// 商品模型
import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String description;
  final double price;

  const CartItem(this.name, this.description, this.price);
}

class CartModel extends ChangeNotifier {
  final List<CartItem> goods = [];

  double get totalprice =>
      goods.map((item) => item.price).reduce((p1, p2) => p1 + p2);

  void additem(final CartItem item) {
    goods.add(item);
    notifyListeners();
  }

  void removeitem(final CartItem item) {
    goods.remove(item);
    notifyListeners();
  }
}
