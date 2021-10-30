import 'dart:math';

import 'package:face_savior/models/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/dataloader.dart';
import 'widgets/layout.dart';

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
      home: const LayoutWidget(
        child: DataLoader(),
      ),
    );
  }
}

class FaceSaviorPage extends StatefulWidget {
  const FaceSaviorPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<PersonSeri> data;

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

  PersonSeri get person => widget.data[index % widget.data.length];

  List<PersonSeri> get data => widget.data;

  void checkAnswer(bool correct) {
    if (correct) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('回答正确'),
        ),
      ).then((_) {
        if (index != data.length - 1) {
          nextPerson();
        } else {
          showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              title: Text('Congratulations'),
              content: Text('Challenge Over'),
            ),
          ).then((_) => Navigator.of(context).pop());
        }
      });
    } else {
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
      body: ListView(
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

  final PersonSeri person;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Center(
      child: Image.network(
        person.img,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (_, err, stack) {
          return Text('Load Error: $err');
        },
      ),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return GestureDetector(
                      onTap: () => Navigator.of(_).pop(),
                      child: imageWidget,
                    );
                  }),
                );
              },
              child: imageWidget,
            ),
          ),
          if (person.desc.trim() != '')
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Text(
                  person.desc,
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
