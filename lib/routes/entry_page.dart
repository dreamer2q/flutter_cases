import 'package:face_savior/routes/cartdemo/card_page.dart';
import 'package:face_savior/routes/heartdemo/heart_page.dart';
import 'package:face_savior/widgets/dataloader.dart';
import 'package:flutter/material.dart';

class EntryPageItem {
  final String name;
  final String description;
  final WidgetBuilder builder;

  const EntryPageItem({
    required this.name,
    required this.description,
    required this.builder,
  });
}

final _entryPages = [
  EntryPageItem(
    name: 'Face Savior',
    description: '脸盲救星',
    builder: (_) => const DataLoader(),
  ),
  EntryPageItem(
    name: 'Cart Demo',
    description: '购物车示例',
    builder: (_) => const CartPage(),
  ),
  EntryPageItem(
    name: "Heart Beats",
    description: "Its a heart",
    builder: (_) => const HeartBeatPage(),
  ),
];

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  Widget Function(EntryPageItem) builder(context) {
    return (EntryPageItem item) {
      return ListTile(
        title: Text(item.name),
        subtitle: Text(item.description),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: item.builder),
          );
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Learn"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: const FlutterLogo(
              size: 128,
              style: FlutterLogoStyle.stacked,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _entryPages.length,
              itemBuilder: (_, i) => builder(_)(_entryPages[i]),
            ),
          ),
        ],
      ),
    );
  }
}
