import 'dart:convert';
import 'dart:math';

import 'package:face_savior/mockdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: LayoutWidget(
        child: DataLoader(),
      ),
    );
  }
}

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          child: child,
        ),
      ),
    );
  }
}

class DataLoader extends StatelessWidget {
  const DataLoader({Key? key}) : super(key: key);

  Future<List<PersonalSeri>> fetcher() async {
    final body =
        await http.read(Uri.parse("https://image.dreamer2q.wang/_/faces.json"));
    final data = json.decode(body);
    return (data as List).map((e) => PersonalSeri.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PersonalSeri>>(
      future: fetcher(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            '${snapshot.error}',
            style: const TextStyle(
              color: Colors.red,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const CupertinoActivityIndicator();
        }
        return FaceSaviorPage(data: snapshot.data!);
      },
    );
  }
}

class FaceSaviorPage extends StatefulWidget {
  const FaceSaviorPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<PersonalSeri> data;

  @override
  State<FaceSaviorPage> createState() => _FaceSaviorPageState();
}

class _FaceSaviorPageState extends State<FaceSaviorPage> {
  final disorders = [
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

  var index = 0;
  PersonalSeri get person => widget.data[index % widget.data.length];
  List<PersonalSeri> get data => widget.data;

  void checkAnswer(bool correct) {
    if (correct) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('回答正确'),
        ),
      ).then((_) => nextPerson());
    } else {
      final person = mockdata[index];
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('BAD LUCK'),
          content: Text(
            '答案是 ${person.name}',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      );
    }
  }

  void nextPerson() {
    setState(() {
      index = (index + 1) % data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final candidates = List.generate(4, (i) => data[(index + i) % data.length]);

    final order = Random(null).nextInt(disorders.length);
    final children = [0, 1, 2, 3].map((i) {
      final choice = ['A', 'B', 'C', 'D'][i];
      final oi = disorders[order][i];
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 16,
        ),
        child: TextButton(
          onPressed: () => checkAnswer(oi == 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                '$choice.  ${candidates[oi - 1].name}',
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Savior'),
      ),
      body: Column(
        children: [
          QuestionWidget(person: person),
          Column(
            children: children.toList(),
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
    final netImage = person.picture.startsWith("http");

    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          netImage
              ? Image.network(person.picture)
              : Image.asset(person.picture),
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
