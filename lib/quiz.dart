import 'package:flutter/material.dart';
import 'package:quiz_app2/first_screen.dart';
import 'package:quiz_app2/questioon_screen.dart';
import 'package:quiz_app2/data/demo_questins.dart';
import 'package:quiz_app2/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswer = [];
  var activeScreen = 'first-screen';

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = FirstScreen(SwitchScreen);
  //   super.initState();
  // }

  void SwitchScreen() {
    setState(() {
      activeScreen = 'question-screen';
      // activeScreen = QuestionScreen();
    });
  }

  void ChoseAnswer(String answer) {
    _selectedAnswer.add(answer);

    if (_selectedAnswer.length == demoquestion.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // final screenWiget = activeScreen == 'first-screen'
    //            ? FirstScreen(SwitchScreen)
    //            : QuestionScreen();

    Widget screenWiget = FirstScreen(SwitchScreen);

    if (activeScreen == 'question-screen') {
      screenWiget = QuestionScreen(
        onSelectedAnswer: ChoseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWiget = ResultScreen(
        chooseAnswer: _selectedAnswer,
      );
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 161, 0, 224),
            Color.fromARGB(255, 93, 12, 199),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: screenWiget,

      // activeScreen == 'first-screen'
      // ? FirstScreen(SwitchScreen)
      // : QuestionScreen(),
    );
  }
}
