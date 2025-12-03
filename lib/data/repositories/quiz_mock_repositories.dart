import '../../model/quiz.dart';
import '../../model/question.dart';
import '../../model/answer.dart';

class QuizMockRepository {
  List<Question> getQuestions() {
    return [
      Question(
        id: 1,
        quizId: 1,
        questionText: "Who is the best teacher?",
        answers: [
          Answer(id: 1, questionId: 1, answerText: "Ronan", isCorrect: true),
          Answer(id: 2, questionId: 1, answerText: "Hongly", isCorrect: false),
          Answer(id: 3, questionId: 1, answerText: "Leangsiv", isCorrect: false),
        ],
      ),
      Question(
        id: 2,
        quizId: 1,
        questionText: "Which language is Flutter based on?",
        answers: [
          Answer(id: 4, questionId: 2, answerText: "Java", isCorrect: false),
          Answer(id: 5, questionId: 2, answerText: "Dart", isCorrect: true),
          Answer(id: 6, questionId: 2, answerText: "Python", isCorrect: false),
        ],
      ),
      Question(
        id: 3,
        quizId: 1,
        questionText: "Who is the real fem boy?",
        answers: [
          Answer(id: 7, questionId: 3, answerText: "Vicheka", isCorrect: false),
          Answer(id: 8, questionId: 3, answerText: "Ah vich", isCorrect: false),
          Answer(id: 9, questionId: 3, answerText: "Ah kmav", isCorrect: true),
        ],
      ),
    ];
  }

  Quiz getQuiz() {
    return Quiz(
      title: "General Knowledge Quiz",
      questions: getQuestions(),
    );
  }
}
