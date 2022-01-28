import 'dart:ui';

import 'package:flutter_cases/models/stats.dart';
import 'package:flutter/material.dart';

const _choice = ['A', 'B', 'C', 'D'];
const _chnum = [0, 1, 2, 3];

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.data}) : super(key: key);

  final ResultStatistics data;

  Widget _stateItem(String label, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildAns(AnswerState ans) {
    final person = ans.person!;
    const style = TextStyle(
      fontSize: 18,
      color: Colors.green,
    );
    Widget titleWidget = const Text(
      '回答正确',
      style: style,
    );
    if (ans.isTimeout) {
      titleWidget = Text(
        '回答超时',
        style: style.copyWith(
          color: Colors.pink,
        ),
      );
    } else if (ans.isWrong) {
      titleWidget = Text(
        '回答错误',
        style: style.copyWith(
          color: Colors.red,
        ),
      );
    }

    final choices =
        _chnum.map((i) => '${_choice[i]}.${ans.answers![i]}').join('  ');

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  person.img,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white30,
                child: Text(person.name),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: titleWidget,
                  ),
                  Text('选项: $choices', overflow: TextOverflow.ellipsis),
                  Text('回答: ${ans.answer}'),
                  Text('用时: ${ans.duration!.inMilliseconds / 1000} 秒'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalspan = data.answers
            .map((e) => e.duration)
            .reduce((a, b) => a! + b!)!
            .inMilliseconds /
        1000;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 24),
                child: const Text(
                  'Challenge Report',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Report Time: ${DateTime.now()}'),
              ),
            ],
          ),
          const Divider(height: 8),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 16),
                _stateItem('题目数量', data.questionCount),
                _stateItem('回答正确', data.rightCount),
                _stateItem('回答错误', data.wrongCount),
                _stateItem('超时次数', data.timeoutCount),
                _stateItem('正确率', data.rightCount / data.questionCount),
                _stateItem('共用时', totalspan),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: const Text('答题详情'),
                ),
                Column(
                  children: data.answers.map(_buildAns).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
