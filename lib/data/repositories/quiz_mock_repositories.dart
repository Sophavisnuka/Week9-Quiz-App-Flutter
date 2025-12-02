import '../../model/quiz.dart';

class QuizMockRepository {
  List<Quiz> getQuestions() {
    return [
      Quiz(
        question: "Who is the best teacher?",
        answers: ["Ronan", "Hongly", "Leangsiv"],
        correctAnswer: "Ronan",
      ),
      Quiz(
        question: "Which language is Flutter based on?",
        answers: ["Java", "Dart", "Python"],
        correctAnswer: "Dart",
      ),
    ];
  }
}
