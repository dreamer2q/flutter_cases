import 'package:flutter/material.dart';

class InheritedCounterPage extends StatelessWidget {
  const InheritedCounterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Counter'),
      ),
      body: const Center(
        child: _CounterWidget(),
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
    return _MyInheritedWidget(
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

class _MyInheritedWidget extends InheritedWidget {
  final int data;

  const _MyInheritedWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  static _MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
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
    final share = _MyInheritedWidget.of(context);
    return Text('${share!.data}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    debugPrint('dependencies change !');
  }
}
