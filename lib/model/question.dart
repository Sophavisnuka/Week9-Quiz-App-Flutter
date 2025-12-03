import 'answer.dart';

// Question model
class Question {
  final int id;
  final int quizId;
  final String questionText;
  final List<Answer> answers;
  int? selectedAnswerId;

  Question({
    required this.id,
    required this.quizId,
    required this.questionText,
    required this.answers,
    this.selectedAnswerId,
  });
}