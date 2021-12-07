import 'package:face_savior/routes/cartdemo/cart_model.dart';
import 'package:flutter/material.dart';

const _allGoods = [
  CartItem("Apple", "An apple a day, keeps doctors away", 0.99),
  CartItem("Orange", "This is an orange", 0.19),
  CartItem("Watermelon", "Fruicy and sweet", 1.99),
  CartItem("Grape", "sour? NO!", 3.19),
  CartItem("Pear", "Make a pair", 2.09),
  CartItem("Strawberry", "An apple a day, keeps doctors away", 0.29),
  CartItem("Banana", "An apple a day, keeps doctors away", 1.99),
  CartItem("Cucumber", "An apple a day, keeps doctors away", 9.99),
  CartItem("Melon", "Sweet Melo", 1),
  CartItem("Tomato", "Tomato", 3.99),
];

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Online"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: _allGoods.length,
            itemBuilder: (_, i) {
              final item = _allGoods[i];
              return ListTile(
                title: Text('${item.name}'),
                subtitle: Text("${item.description}"),
                trailing: Text(
                  '${item.price}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
