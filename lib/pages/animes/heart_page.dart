import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HeartBeatPage extends StatelessWidget {
  const HeartBeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Beats"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const HeartBeats(),
          ),
        ],
      ),
    );
  }
}

class HeartBeats extends StatefulWidget {
  const HeartBeats({Key? key}) : super(key: key);

  @override
  State<HeartBeats> createState() => _HeartBeatsState();
}

class _HeartBeatsState extends State<HeartBeats>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controler;

  late final Animation<Size?> _animateSize;
  late final Animation<double?> _animationTop;

  @override
  void initState() {
    super.initState();

    _controler = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    final _curved = CurvedAnimation(
      parent: _controler,
      curve: Curves.elasticIn,
    );

    _animateSize = SizeTween(
      begin: const Size(99, 90),
      end: const Size(119, 100),
    ).animate(_curved);

    _animationTop = Tween<double>(
      begin: 20,
      end: 50,
    ).animate(_curved);

    _controler.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controler.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controler.forward();
      }
    });

    _controler.forward();
  }

  @override
  void dispose() {
    _controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animateSize,
      builder: (BuildContext context, Widget? child) {
        return HeartPaintIcon(
          size: _animateSize.value!,
          top: _animationTop.value!,
        );
      },
    );
  }
}

class HeartIcon extends StatelessWidget {
  const HeartIcon({
    Key? key,
    this.size = const Size(55, 50),
    this.top = 0.0,
  }) : super(key: key);

  final Size size;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: EdgeInsets.only(bottom: top),
      width: size.width,
      height: size.height,
      child: SvgPicture.asset(
        "assets/svg/heart-thin.svg",
        fit: BoxFit.fill,
        color: Colors.red,
      ),
    );
  }
}

class HeartPaintIcon extends StatelessWidget {
  const HeartPaintIcon({
    Key? key,
    this.size = const Size(55, 50),
    this.top = 0.0,
  }) : super(key: key);

  final Size size;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: EdgeInsets.only(bottom: top),
      width: size.width,
      height: size.height,
      child: CustomPaint(
        size: size,
        painter: HeartPainter(),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    Paint paint1 = Paint();
    paint1
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
