import 'package:flutter/material.dart';
import 'package:quizapp/ui/widgets/answer_card.dart';
// import 'package:quizapp/ui/widgets/navigate_button.dart';
import '../../data/repositories/quiz_mock_repositories.dart';
import '../../model/quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}
class _QuestionScreenState extends  State<QuestionScreen> {

  final List<Quiz> questions = QuizMockRepository().getQuestions();
  int currentIndex = 0;
  int score = 0;

  void chooseAnswer(String answer) {
    if (answer == questions[currentIndex].correctAnswer) {
      score++;
    }
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex ++;
      });
    } else {
      print('final score: $score');
    }
  }

  @override
  Widget build(BuildContext context) {

    // questions = QuizMockRepository().getQuestions();
    final currentQuestion = questions[currentIndex];

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentQuestion.question,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    for(var answer in currentQuestion.answers) ...[
                      AnswerCard(
                        label: answer, 
                        onTap: () => chooseAnswer(answer)
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}