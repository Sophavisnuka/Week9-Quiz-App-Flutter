// Answer model
class Answer {
  final int id;
  final int questionId;
  final String answerText;
  final bool isCorrect;

  Answer({
    required this.id,
    required this.questionId,
    required this.answerText,
    required this.isCorrect,
  });
}