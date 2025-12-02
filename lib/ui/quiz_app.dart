import 'package:flutter/material.dart';
import 'package:quizapp/ui/screens/question_screen.dart';
import 'package:quizapp/ui/screens/welcome_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp( {super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}
class _QuizAppState extends State<QuizApp> {

  bool isScreenChange = false;

  void changeScreen() {
    setState(() {
      isScreenChange = !isScreenChange;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: isScreenChange ? QuestionScreen() : WelcomeScreen(startQuiz: changeScreen),
        ),
      ),
    );
  }
}