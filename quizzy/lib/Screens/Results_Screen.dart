import 'package:flutter/material.dart';
import 'package:quizzy/Themes/backgroundColors.dart';
import 'package:quizzy/data/Questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColours.blue(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("You Answered 3/5 Questions Correctly!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 201, 153, 251),
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 30),

                const Text("List of answers"),

                const SizedBox(height: 30),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Restart Quiz"),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}