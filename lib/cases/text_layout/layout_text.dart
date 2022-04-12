import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class _Avatar extends StatelessWidget {
  const _Avatar({
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

class MomentCommentSeri {
  final String nickname;
  final String comment;
  final String? replyTo;
  final List<MomentCommentSeri>? children;

  const MomentCommentSeri(
    this.nickname,
    this.comment, [
    this.replyTo,
    this.children,
  ]);
}

const mockComments = [
  MomentCommentSeri('Eijiro Kirishima', 'Greate!'),
  MomentCommentSeri('Levi', 'A lucky winner!', null, [
    MomentCommentSeri(
      'Jeff Miller',
      'walked down, trying to recapture his good feelings',
    ),
    MomentCommentSeri(
      'Levi',
      'In my life, I still believed in the magical trifecta—Santa Claus, the '
          'Easter Bunny, and the Tooth Fairy.Most English children write their'
          ' lists of presents to Father Christmas',
      'Eijiro Kirishima',
    ),
    MomentCommentSeri(
      'Levi',
      'In my life, I still believed in the magical trifecta—Santa Claus, the ',
      'Eijiro Kirishima',
    ),
  ]),
  MomentCommentSeri('Eijiro Kirishima', 'Greate!'),
  MomentCommentSeri('Eijiro Kirishima', 'Greate!'),
  MomentCommentSeri('Eijiro Kirishima', 'Greate!'),
];

class MomentComments extends StatefulWidget {
  const MomentComments({
    Key? key,
    this.comments = mockComments,
    this.maxCommentLines = 5,
  }) : super(key: key);

  final List<MomentCommentSeri> comments;
  final int maxCommentLines;

  @override
  State<MomentComments> createState() => _MomentCommentsState();
}

class _MomentCommentsState extends State<MomentComments> {
  @override
  Widget build(BuildContext context) {
    int currentLines = 0;
    final commentWidgets = <Widget>[];
    return LayoutBuilder(
      builder: (_, constraints) {
        for (final comment in widget.comments) {
          final leftLines = widget.maxCommentLines - currentLines;
          final rowLines =
              _CommentRow.layoutLines(comment, constraints.maxWidth);
          final maxLines = min(rowLines, leftLines);
          final child = _CommentRow(
            comment: comment,
            maxLines: maxLines,
          );
          commentWidgets.add(child);
          currentLines += maxLines;
          if (currentLines == widget.maxCommentLines) {
            break;
          }

          if (comment.children != null) {
            final childrenWidget = <Widget>[];
            for (final comment in comment.children!) {
              final leftLines = widget.maxCommentLines - currentLines;
              final rowLines =
                  _CommentRow.layoutLines(comment, constraints.maxWidth);
              final maxLines = min(rowLines, leftLines);
              final child = _CommentRow(
                comment: comment,
                maxLines: maxLines,
              );
              childrenWidget.add(child);
              currentLines += maxLines;
              if (currentLines == widget.maxCommentLines) {
                break;
              }
            }
            if (childrenWidget.isNotEmpty) {
              commentWidgets.add(
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: childrenWidget,
                  ),
                ),
              );
            }
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: commentWidgets,
        );
      },
    );
  }
}

class _CommentRow extends StatelessWidget {
  static TextSpan _buildTextSpan(MomentCommentSeri comment) {
    final nickname = comment.replyTo == null
        ? comment.nickname
        : '${comment.nickname} @ ${comment.replyTo}';

    final userStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );
    return TextSpan(
      children: [
        TextSpan(
          text: nickname,
          style: userStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              debugPrint('$nickname');
            },
        ),
        if (comment.replyTo != null) ...[
          TextSpan(text: ' @ '),
          TextSpan(text: comment.replyTo!, style: userStyle),
        ],
        TextSpan(text: ' ' + comment.comment),
      ],
    );
  }

  static int layoutLines(MomentCommentSeri comment, double maxWidth) {
    final text = _buildTextSpan(comment);
    final textPainter = TextPainter(
      text: text,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: maxWidth);
    return textPainter.computeLineMetrics().length;
  }

  const _CommentRow({
    Key? key,
    required this.comment,
    this.maxLines = 3,
  }) : super(key: key);

  final MomentCommentSeri comment;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    if (maxLines <= 0) {
      return SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text.rich(
        _buildTextSpan(comment),
        maxLines: maxLines,
      ),
    );
  }
}

class _MomentWidget extends StatelessWidget {
  const _MomentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _Avatar(),
            Text(
              "Hermione Granger",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          "Nature has its own form of art!"
          " It's so beautiful, so essential,"
          " so inspiring, and so much more"
          " than just a museum! The story is"
          " told with a complete absence of"
          " contrivance.The reader is told "
          "the story in ...",
        ),
        MomentComments(),
      ],
    );
  }
}

class LayoutTextPage extends StatelessWidget {
  const LayoutTextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Text"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _MomentWidget(),
        ],
      ),
    );
  }
}
