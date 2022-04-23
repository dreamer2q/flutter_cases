import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'widgets/add_button.dart';

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

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.item,
    required this.endOffset,
  }) : super(key: key);

  final CartItem item;
  final Offset Function() endOffset;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CartModel>();
    final count = model.goods.where((good) => good == item).length;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(item.description),
                ),
                Text(
                  '${item.price} \$',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              if (count > 0)
                IconButton(
                  onPressed: () => model.removeitem(item),
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                ),
              Text(
                '$count',
                style: const TextStyle(fontSize: 14),
              ),
              AddCartButton(
                onPressed: () => model.additem(item),
                endOffset: endOffset,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _endKey = GlobalKey();
  late final Offset _endOffset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((delta) {
      _endOffset = (_endKey.currentContext!.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartModel>(
      create: (_) => CartModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shop Online"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _allGoods.length,
                  itemBuilder: (_, i) {
                    final item = _allGoods[i];
                    return CartItemWidget(
                      item: item,
                      endOffset: () => _endOffset,
                    );
                  },
                ),
              ),
              CartCheckWidget(cartKey: _endKey),
            ],
          ),
        ),
      ),
    );
  }
}

class CartCheckWidget extends StatelessWidget {
  const CartCheckWidget({
    Key? key,
    required this.cartKey,
  }) : super(key: key);

  final GlobalKey cartKey;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CartModel>();
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 8, right: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  key: cartKey,
                  color: Colors.green,
                  size: 38,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '${model.goods.length}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Total: ${model.totalprice.toStringAsPrecision(3)} \$"),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.price_check),
            label: const Text('Check Out'),
          ),
        ],
      ),
    );
  }
}
