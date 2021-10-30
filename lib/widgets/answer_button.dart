import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({
    Key? key,
    required this.choice,
    required this.answer,
    required this.onPressed,
    required this.rightAnswer,
  }) : super(key: key);

  final bool rightAnswer;
  final String answer;
  final VoidCallback onPressed;
  final int choice;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  var color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final ch = ['A', 'B', 'C', 'D'][widget.choice];
    return TextButton(
      onPressed: () {
        setState(() {
          color = widget.rightAnswer ? Colors.green : Colors.red;
        });
        widget.onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            '$ch.  ${widget.answer}',
          ),
        ),
      ),
    );
  }
}
