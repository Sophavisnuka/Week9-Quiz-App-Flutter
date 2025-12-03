import 'package:flutter/material.dart';
import 'package:quizapp/ui/widgets/answer_card.dart';
import '../../data/repositories/quiz_mock_repositories.dart';
import '../../model/question.dart';

class QuestionScreen extends StatefulWidget {

  final void Function(int score, List<Question> questions) onQuizCompleted;
  const QuestionScreen({
    super.key,
    required this.onQuizCompleted
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}
class _QuestionScreenState extends  State<QuestionScreen> {

  final List<Question> questions = QuizMockRepository().getQuestions();
  int currentIndex = 0;
  int score = 0;

  void chooseAnswer(int answerId) {
    final currentQuestion = questions[currentIndex];
    currentQuestion.selectedAnswerId = answerId;
    
    // Check if answer is correct
    final selectedAnswer = currentQuestion.answers.firstWhere((answer) => answer.id == answerId);
    if (selectedAnswer.isCorrect) {
      score++;
    }
    
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex ++;
      });
    } else {
      widget.onQuizCompleted(score, questions);
    }
  }

  @override
  Widget build(BuildContext context) {

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
                      currentQuestion.questionText,
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
                        label: answer.answerText, 
                        onTap: () => chooseAnswer(answer.id)
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