import 'package:flutter/material.dart';
import '../../model/answer.dart';
import '../../model/question.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final List<Question> questions;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.score,
    required this.questions,
    required this.onRestart,
  });

  Color getAnswerColor(Question q, Answer answer) {
    final bool isUserSelected = answer.id == q.selectedAnswerId;
    final bool isCorrectAnswer = answer.isCorrect;

    if (isCorrectAnswer) {
      return Colors.green;
    } else if (isUserSelected && !isCorrectAnswer) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "You answered $score on ${questions.length}!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              // LIST OF QUESTIONS
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    final q = questions[index];
                    final selectedAnswer = q.selectedAnswerId != null 
                      ? q.answers.firstWhere((a) => a.id == q.selectedAnswerId)
                      : null;
                    final isCorrect = selectedAnswer?.isCorrect ?? false;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: isCorrect ? Colors.green : Colors.red,
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  q.questionText,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          // ANSWERS LIST (color only)
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: q.answers.map((answer) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    answer.answerText,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: getAnswerColor(q, answer),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(height: 1, color: Colors.white30),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Restart Button
              Center(
                child: ElevatedButton(
                  onPressed: onRestart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                        horizontal: 45, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Restart Quiz"),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
