import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cases/pages/anime_heartbeat_page/heart_page.dart';
import 'package:flutter_cases/pages/case_entry_page.dart';

import 'anime_cart_page/cart_page.dart';
import 'custom_transition_page/custom_page_view_page.dart';
import 'inherited_counter_page/inherited_counter.dart';

class CaseEntryItem {
  final String title;
  final String descript;
  final WidgetBuilder builder;

  CaseEntryItem({
    required this.title,
    required this.builder,
    this.descript = '',
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _caseList = [
    CaseEntryItem(
      title: 'Cart BezierCurve',
      descript: '添加商品的贝塞尔曲线动画',
      builder: (_) => const CartPage(),
    ),
    CaseEntryItem(
      title: 'Anime Heart Beat',
      descript: 'Animated Heart Beating',
      builder: (_) => const HeartBeatPage(),
    ),
    CaseEntryItem(
      title: 'Counter using InheritedWidget',
      descript: 'Share data across Widgets',
      builder: (_) => const InheritedCounterPage(),
    ),
    CaseEntryItem(
      title: "PageView Transition",
      descript: "Customize your PageView transition",
      builder: (_) => const CustomPageViewTransitionPage(),
    ),
  ];

  Widget _childBuilder(BuildContext _, int index) {
    final c = _caseList[index];
    return ListTile(
      title: Text(c.title),
      subtitle: c.descript.isNotEmpty ? Text(c.descript) : null,
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (_) => CaseEntryPage(item: c),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            CupertinoSliverNavigationBar(
              automaticallyImplyLeading: false,
              largeTitle: Text('Flutter Cases'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                _childBuilder,
                childCount: _caseList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
