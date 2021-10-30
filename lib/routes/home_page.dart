import 'dart:math';

import 'package:face_savior/models/person.dart';
import 'package:flutter/material.dart';

import 'datalist_page.dart';
import 'face_challenge_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<PersonSeri> data;

  void startChallenge(context, [int count = 4]) {
    // 集合
    final n = <PersonSeri>{};
    while (n.length != count) {
      final i = Random(null).nextInt(data.length);
      n.add(data[i]);
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChallengePage(data: n.toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Savior'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DataListPage(data: data),
              ),
            ),
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/faces.png'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Text(
                '  准备好了吗？',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            Text('Data Loaded: ${data.length}'),
            Container(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => startChallenge(context),
                    child: const Text("小试身手 4个"),
                  ),
                  if (data.length > 10)
                    ElevatedButton(
                      onPressed: () => startChallenge(context, 10),
                      child: const Text("十发入魂 10个"),
                    ),
                  ElevatedButton(
                    onPressed: () => startChallenge(context, data.length),
                    child: Text("一起来吧 ${data.length}个"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
