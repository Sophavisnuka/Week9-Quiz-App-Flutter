import 'package:flutter/material.dart';
import 'package:quizapp/ui/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  
  final VoidCallback startQuiz;

  const WelcomeScreen({
    super.key,
    required this.startQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Quiz App', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Image(
            image: AssetImage('assets/quiz-logo.png'),
            width: 250,
          ),
          SizedBox(height: 30),
          AppButton(icon: Icons.start, 'Start', onTap: startQuiz),
        ],
      ),
    );
  }
}
