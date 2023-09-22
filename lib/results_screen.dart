import 'package:flutter/material.dart';
import 'package:quiz_app2/data/demo_questins.dart';
import 'package:quiz_app2/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer});

  final List<String> chooseAnswer;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add(
        {
          'questions_index': i,
          'question': demoquestion[i].text,
          'corect_answer': demoquestion[i].answer[0],
          'user_answer': chooseAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numTotalQuestion = demoquestion.length;
    final numCorrectQuestion = summaryData
        .where((data) => data['user_answer'] == data['corect_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You Answer $numCorrectQuestion out of $numTotalQuestion questions Corectly '),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('Rest The Quiz'))
          ],
        ),
      ),
    );
  }
}
