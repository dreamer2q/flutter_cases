import 'dart:math';

import 'package:face_savior/mockdata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Savior',
      theme: ThemeData(primarySwatch: Colors.brown),
      debugShowCheckedModeBanner: false,
      home: FaceSaviorPage(),
    );
  }
}

class FaceSaviorPage extends StatelessWidget {
  FaceSaviorPage({Key? key}) : super(key: key);

  final orders = ['A. ', 'B. ', 'C. ', 'D. '];
  final randomOrders = [
    [1, 2, 3, 4],
    [1, 2, 4, 3],
    [1, 4, 2, 3],
    [4, 1, 2, 3],
    [1, 3, 2, 4],
    [3, 1, 2, 4],
    [2, 1, 3, 4],
  ];

  @override
  Widget build(BuildContext context) {
    var randIndex = Random(null).nextInt(mockdata.length);
    const currIndex = 1;
    var p = mockdata[currIndex];
    var ans =
        List.generate(4, (i) => mockdata[(currIndex + i) % mockdata.length]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Savior'),
      ),
      body: Column(
        children: [
          QuestionWidget(person: p),
          Column(
            children: [0, 1, 2, 3].map(
              (ansIndex) {
                var ansOrder = orders[ansIndex];
                var randOrder = randomOrders[randIndex][ansIndex];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 16,
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (randOrder == 1) {
                        debugPrint("success");
                      } else {
                        debugPrint('fail');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          '$ansOrder ${ans[randOrder - 1].name}',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.person}) : super(key: key);

  final PersonalSeri person;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Image.asset(person.picture),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Text(
                person.description,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
