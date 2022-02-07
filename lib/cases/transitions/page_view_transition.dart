import 'package:flutter/material.dart';
import 'package:flutter_cases/constants/text_styles.dart';

// ref:
// https://medium.com/flutter-community/a-deep-dive-into-pageview-in-flutter-with-custom-transitions-581d9ea6dded

class PageViewTransitionPage extends StatefulWidget {
  const PageViewTransitionPage({Key? key}) : super(key: key);

  @override
  State<PageViewTransitionPage> createState() => _PageViewTransitionPageState();
}

class _PageViewTransitionPageState extends State<PageViewTransitionPage> {
  late final PageController _pageController;
  double pageOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _pageController.addListener(() {
      // listen and update current pageOffset
      setState(() {
        // this is used for rebuilding transform
        pageOffset = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // remove listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom PageView Transition'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: PageView.builder(
          itemBuilder: (_, index) {
            final child = Container(
              color: index.isOdd ? Colors.red : Colors.green,
              alignment: Alignment.center,
              child: Text(
                'Page $index',
                style: FCStyles.baseStyle.copyWith(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            );
            return child;
          },
        ),
      ),
    );
  }
}
