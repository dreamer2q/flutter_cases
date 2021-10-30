import 'package:face_savior/models/person.dart';

class ResultStatistics {
  ResultStatistics(this.questionCount);

  final int questionCount; // 问题数量
  int rightCount = 0; // 回答正确数
  int wrongCount = 0; // 回答错误数
  int timeoutCount = 0; // 超时数量
  DateTime startPoint = DateTime.now();
  DateTime? endPoint;

  List<AnswerState> answers = [];
}

class AnswerState {
  final PersonSeri? person;
  final List<String>? answers;
  final String? answer;
  final Duration? duration;

  bool get isWrong => answer == person?.name;
  bool get isTimeout => answer == null;

  AnswerState({
    this.person,
    this.answers,
    this.answer,
    this.duration,
  });
}
