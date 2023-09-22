import 'package:flutter/material.dart';
import 'package:quiz_app2/models/answer_button.dart';
import 'package:quiz_app2/data/demo_questins.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = demoquestion[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentQuestion.text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.shuffuledAnswer.map((answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              }),

              // AnswerButton(
              //   onTap: () {},
              //   answerText: currentQuestion.answer[0],
              // ),
              // AnswerButton(
              //   onTap: () {},
              //   answerText: currentQuestion.answer[1],
              // ),
              // AnswerButton(
              //   onTap: () {},
              //   answerText: currentQuestion.answer[2],
              // ),
              // AnswerButton(
              //   onTap: () {},
              //   answerText: currentQuestion.answer[3],
              // ),
            ]),
      ),
    );
  }
}
