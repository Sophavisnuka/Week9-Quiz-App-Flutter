import 'package:flutter/material.dart';
import 'package:quizapp/ui/screens/question_screen.dart';
import 'package:quizapp/ui/screens/result_screen.dart';
import 'package:quizapp/ui/screens/welcome_screen.dart';

enum Screen {
  welcome,
  quiz,
  result
}

class QuizApp extends StatefulWidget {
  const QuizApp( {super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}
class _QuizAppState extends State<QuizApp> {

  Screen currentState = Screen.welcome;
  int finalScore = 0;

  void start() {
    setState(() {
      currentState = Screen.welcome;
    });
  }
  void question() {
    setState(() {
      currentState = Screen.quiz;
    });
  }
  void result(int score) {
    setState(() {
      finalScore = score;
      currentState = Screen.result;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    Widget quizScreen;

    if (currentState == Screen.welcome) {
      quizScreen = WelcomeScreen(startQuiz: question);
    } else if (currentState == Screen.quiz) {
      quizScreen = QuestionScreen(onQuizCompleted: result);
    } else {
      quizScreen = ResultScreen(
        score: finalScore,
        onRestart: start
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: quizScreen
        ),
      ),
    );
  }
}