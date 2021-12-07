import 'package:flutter/material.dart';

class InheritedCounterPage extends StatelessWidget {
  const InheritedCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('退出'),
              content: const Text('你确定要退出吗?'),
              actions: [
                TextButton(
                  child: const Text('确认'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                TextButton(
                  child: const Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          },
        );
        return result!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inherited Counter'),
        ),
        body: const Center(
          child: _CounterWidget(),
        ),
      ),
    );
  }
}

class _CounterWidget extends StatefulWidget {
  const _CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<_CounterWidget> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShareInheritedWidget(
      data: count,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: _CounterDisplayWidget(),
          ),
          ElevatedButton(
            child: const Text('Increment'),
            onPressed: increment,
          ),
        ],
      ),
    );
  }
}

class ShareInheritedWidget extends InheritedWidget {
  final int data;

  const ShareInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  static ShareInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ShareInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _CounterDisplayWidget extends StatefulWidget {
  const _CounterDisplayWidget({Key? key}) : super(key: key);

  @override
  __CounterDisplayWidgetState createState() => __CounterDisplayWidgetState();
}

class __CounterDisplayWidgetState extends State<_CounterDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    final share = ShareInheritedWidget.of(context);
    return Text('${share!.data}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    debugPrint('dependencies change !');
  }
}
