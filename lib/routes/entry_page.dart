import 'package:flutter_cases/cases/transitions/page_view_transition.dart';
import 'package:flutter_cases/demos/animated_slide_in.dart';
import 'package:flutter_cases/routes/cartdemo/card_page.dart';
import 'package:flutter_cases/routes/heartdemo/heart_page.dart';
import 'package:flutter_cases/widgets/dataloader.dart';
import 'package:flutter/material.dart';

import 'overflow/text_overflow_page.dart';

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
  EntryPageItem(
    name: "Text Overflow",
    description: "",
    builder: (_) => const TextOverflowPage(),
  ),
  EntryPageItem(
    name: "PageView Transition",
    description: "Custom",
    builder: (_) => const PageViewTransitionPage(),
  ),
  EntryPageItem(
    name: "Animated SlideIn",
    description: "animted slide in ribbons",
    builder: (_) => const AnimatedSlideInPage(),
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
        title: const Text("Flutter Cases Learn"),
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
