import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cases/pages/heroes/scenario_example_page.dart';
import 'package:flutter_cases/pages/animes/heart_page.dart';
import 'package:flutter_cases/pages/case_entry_page.dart';
import 'package:flutter_cases/pages/swipe_route_page/swipe_route_page.dart';

import 'bezier_curves/cart_page.dart';
import 'transitions/custom_page_view_page.dart';
import 'state_manage/inherited_counter.dart';

class CaseEntryItem {
  final String title;
  final String desc;
  final WidgetBuilder builder;

  CaseEntryItem({
    required this.title,
    required this.builder,
    this.desc = '',
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
      desc: '添加商品的贝塞尔曲线动画',
      builder: (_) => const CartPage(),
    ),
    CaseEntryItem(
      title: 'Beating Heart',
      desc: 'Animated Heart Beating',
      builder: (_) => const HeartBeatPage(),
    ),
    CaseEntryItem(
      title: 'Counter (InheritedWidget)',
      desc: 'Share data across Widgets',
      builder: (_) => const InheritedCounterPage(),
    ),
    CaseEntryItem(
      title: "PageView Transition",
      desc: "Customize your PageView transition",
      builder: (_) => const CustomPageViewTransitionPage(),
    ),
    CaseEntryItem(
      title: "SwipeRoutePage",
      desc: "Swipe left to open a new page",
      builder: (_) => const SwipeRoutePage(),
    ),
    CaseEntryItem(
      title: "SwipeRoutePage",
      desc: "Swipe left to open a new page",
      builder: (_) => const ScenarioExamplePage(),
    ),
  ];

  Widget _childBuilder(BuildContext _, int index) {
    final c = _caseList[index];
    return ListTile(
      title: Text(c.title),
      subtitle: c.desc.isNotEmpty ? Text(c.desc) : null,
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
