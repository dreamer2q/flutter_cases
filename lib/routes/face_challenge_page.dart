import 'dart:math';

import 'package:face_savior/models/person.dart';
import 'package:face_savior/models/stats.dart';
import 'package:face_savior/routes/result_page.dart';
import 'package:face_savior/widgets/answer_button.dart';
import 'package:face_savior/widgets/person.dart';
import 'package:flutter/material.dart';

// 答案随机排序, 共 24 种可能
const disorders = [
  [1, 2, 3, 4],
  [1, 2, 4, 3],
  [1, 3, 2, 4],
  [1, 3, 4, 2],
  [1, 4, 2, 3],
  [1, 4, 3, 2],
  [2, 1, 3, 4],
  [2, 1, 4, 3],
  [2, 3, 1, 4],
  [2, 3, 4, 1],
  [2, 4, 1, 3],
  [2, 4, 3, 1],
  [3, 1, 2, 4],
  [3, 1, 4, 2],
  [3, 2, 1, 4],
  [3, 2, 4, 1],
  [3, 4, 1, 2],
  [3, 4, 2, 1],
  [4, 1, 2, 3],
  [4, 1, 3, 2],
  [4, 2, 1, 3],
  [4, 2, 3, 1],
  [4, 3, 1, 2],
  [4, 3, 2, 1],
];

class ChallengePage extends StatefulWidget {
  const ChallengePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<PersonSeri> data;

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage>
    with SingleTickerProviderStateMixin {
  // 倒计时
  late AnimationController _controller;
  late Animation<Color?> _colorValue;
  late Animation<double> _progressValue;
  // 问题索引
  var index = 0;
  // 统计结果
  late ResultStatistics result;

  PersonSeri get person => widget.data[index % widget.data.length];
  List<PersonSeri> get data => widget.data;
  List<PersonSeri> get candidates =>
      List.generate(4, (i) => data[(index + i) % data.length]);

  @override
  void initState() {
    super.initState();
    result = ResultStatistics(data.length);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _progressValue = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);

    _colorValue = ColorTween(
      begin: Colors.brown,
      end: Colors.red,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      debugPrint('status change => $status');
      if (status == AnimationStatus.completed) {
        nextOne(); // timeout
      }
    });
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  void nextOne([String? answer]) {
    final spantime = Duration(
        milliseconds: ((1 - _progressValue.value) * 10 * 1000).toInt());
    final isRight = answer == person.name;
    final ansState = AnswerState(
      person: person,
      answer: answer,
      duration: spantime,
      answers: candidates.map((e) => e.name).toList(),
    );

    result.answers.add(ansState);
    if (answer == null) {
      result.timeoutCount++;
    } else if (isRight) {
      result.rightCount++;
    } else {
      result.wrongCount++;
    }
    if (index < data.length - 1) {
      setState(() {
        index = (index + 1) % data.length;
      });
    } else {
      //print done
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultPage(
            data: result,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final indexIndicator = Center(
      child: Text.rich(
        TextSpan(
          text: '${index + 1}',
          style: const TextStyle(fontSize: 18),
          children: [
            const TextSpan(
              text: ' / ',
              style: TextStyle(fontSize: 16),
            ),
            TextSpan(
              text: '${data.length}\t\t',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    final order = Random(null).nextInt(disorders.length);
    final children = [0, 1, 2, 3].map((i) {
      final oi = disorders[order][i];
      final answer = candidates[oi - 1].name;
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 16,
        ),
        child: AnswerButton(
          key: UniqueKey(),
          choice: i,
          answer: answer,
          rightAnswer: oi == 1,
          onPressed: () {
            _controller.stop();
            Future.delayed(const Duration(milliseconds: 500))
                .then((_) => nextOne(answer));
          },
        ),
      );
    });

    _controller.reset();
    _controller.forward();

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Face Challenge'),
          actions: [indexIndicator],
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: AnimatedBuilder(
              animation: _progressValue,
              builder: (context, Widget? child) {
                return LinearProgressIndicator(
                  value: _progressValue.value,
                  valueColor: _colorValue,
                );
              },
            ),
          ),
        ),
        body: ListView(
          children: [
            PersonWidget(person: person),
            Column(
              children: children.toList(),
            )
          ],
        ),
      ),
    );
  }
}
