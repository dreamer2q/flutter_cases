import 'package:flutter/material.dart';

class TextOverflowPage extends StatelessWidget {
  const TextOverflowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const txt =
        'This is a very long text in order it cannot be display in one line';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Overflow'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(color: Colors.red, width: 50),
                const Expanded(
                  child: Text(
                    txt,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(color: Colors.green, width: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
