import 'package:flutter/material.dart';
import 'package:flutter_cases/pages/transitions/swipe_route_page/swipe_route.dart';

class SwipeRoutePage extends StatefulWidget {
  const SwipeRoutePage({
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeRoutePage> createState() => _SwipeRoutePageState();
}

class _SwipeRoutePageState extends State<SwipeRoutePage> {
  @override
  Widget build(BuildContext context) {
    return SwipePageContainer(
      pageBuilder: (BuildContext context) {
        return const _SwipeSecondPage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 100,
            color: Colors.red,
            child: Text('First Page'),
          ),
        ),
      ),
    );
  }
}

class _SwipeSecondPage extends StatefulWidget {
  const _SwipeSecondPage({
    Key? key,
  }) : super(key: key);

  @override
  State<_SwipeSecondPage> createState() => _SwipeSecondPageState();
}

class _SwipeSecondPageState extends State<_SwipeSecondPage> {
  @override
  void initState() {
    super.initState();
    debugPrint('initState: _SwipeSecondPageState');
  }

  @override
  void dispose() {
    debugPrint('dispose: _SwipeSecondPageState');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          color: Colors.blue,
          child: Text('Second Page'),
        ),
      ),
    );
  }
}
