import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExampleIcon extends StatelessWidget {
  const ExampleIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Color(0xFF5C00B8),
            Color(0xFF8000FF),
            Color(0xFFFF7283),
            Color(0xFFFFCAAC),
            Color(0xFF8000FF),
            Color(0xFF5C00B8),
          ],
          stops: const [0.1, 0.2, 0.4, 0.55, 0.9, 1.0],
        ),
      ),
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: (math.pi / 180) * -20,
        child: Text(
          'Example',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class AvatarIzuku extends StatelessWidget {
  const AvatarIzuku({
    Key? key,
    this.size = 32,
    this.padding = const EdgeInsets.all(4),
  }) : super(key: key);

  final double size;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        'assets/avatar/izuku.png',
        width: size,
        height: size,
      ),
    );
  }
}

class Scenario extends StatelessWidget {
  const Scenario({
    Key? key,
    this.title = const Text('Scenario'),
    this.body = const Text('Body'),
    this.padding = const EdgeInsets.all(8),
    this.avatar = const AvatarIzuku(),
    this.backgroundColor = const Color(0xFFECCBFF),
  }) : super(key: key);

  final Widget avatar;
  final Widget title;
  final Widget body;
  final EdgeInsets padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18).copyWith(
          bottomLeft: Radius.circular(4),
        ),
        color: Colors.white,
      ),
      child: body,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isFlying = constraints.hasBoundedHeight;
        return Material(
          child: Padding(
            padding: padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: avatar,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18).copyWith(
                        bottomLeft: Radius.circular(4),
                      ),
                      color: backgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: title,
                        ),
                        isFlying ? Expanded(child: child) : child,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ScenarioExample extends StatelessWidget {
  const ScenarioExample({
    Key? key,
    this.text = 'This is an Scenario Example',
    this.title = 'Example Title',
  }) : super(key: key);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: const [
          Scenario(
            padding: EdgeInsets.only(
              right: 8,
              top: 12,
            ),
            avatar: AvatarIzuku(),
            title: Text(
              'Watching TV and movies',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF894BE9),
                fontWeight: FontWeight.w600,
              ),
            ),
            body: Text(
              'Blimey! Can you believe that Ron hasn\'t '
              'watched Squid Game? But I guess he hasn\'t '
              'watched any muggle series really. '
              'I do miss TV and theaters while I\'m at Hogworts! '
              'Hardly anyone knows what I\'m talking about'
              ' when I bring them up! Btw do you wanna '
              'come and go to the theater with me someday?',
              style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ExampleIcon(),
          ),
        ],
      ),
    );
  }
}

class ScenarioPicker extends StatelessWidget {
  const ScenarioPicker({Key? key}) : super(key: key);

  static const String tag = 'scenario-picker';

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: LayoutBuilder(
        builder: (context, constraints) {
          debugPrint("picker constraints: $constraints");
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, first, second) {
                    final page = ScenarioExample2Page();
                    return FadeUpwardsPageTransitionsBuilder()
                        .buildTransitions(null, context, first, second, page);
                  },
                ),
              );
            },
            child: Scenario(
              avatar: AvatarIzuku(),
              backgroundColor: Color(0xFFFE4294),
              title: Text(
                'Pick a Scenario →',
                style: TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              body: Text(
                'Create for Izuku Midoriya',
                style: TextStyle(
                  color: Color(0x2D2D2D66),
                  fontSize: 16,
                  height: 24 / 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScenarioPicker2 extends StatelessWidget {
  const ScenarioPicker2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ScenarioPicker.tag,
      child: LayoutBuilder(
        builder: (context, constraints) {
          debugPrint("picker2 constraints: $constraints");
          return Scenario(
            avatar: AvatarIzuku(),
            backgroundColor: Color(0xFFFE4294),
            title: Text(
              'Pick a Scenario →',
              style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            body: SizedBox(
              height: 150,
              child: Text(
                'Create for Izuku Midoriya',
                style: TextStyle(
                  color: Color(0x2D2D2D66),
                  fontSize: 16,
                  height: 24 / 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScenarioExamplePage extends StatelessWidget {
  const ScenarioExamplePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Izuku Midoriya'),
        ),
        body: ListView(
          children: const [
            ScenarioExample(),
            ScenarioPicker(),
          ],
        ),
      ),
    );
  }
}

class ScenarioExample2Page extends StatelessWidget {
  const ScenarioExample2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
          actions: [
            UnconstrainedBox(
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.question_circle,
                ),
              ),
            ),
            SizedBox(width: 16),
            UnconstrainedBox(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                visualDensity: VisualDensity.compact,
                color: Color(0xFFFE4294),
                disabledColor: Color(0xFFFE4294).withOpacity(0.4),
                elevation: 0,
                highlightElevation: 0,
                disabledElevation: 0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: null,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: ListView(
          children: const [
            ScenarioPicker2(),
          ],
        ),
      ),
    );
  }
}
