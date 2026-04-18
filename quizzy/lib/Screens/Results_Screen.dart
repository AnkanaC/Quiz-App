import 'package:flutter/material.dart';
import 'package:quizzy/Screens/QuestionsPage.dart';
import 'package:quizzy/Themes/backgroundColors.dart';
import 'package:quizzy/data/Questions.dart';
import 'package:quizzy/models/QuestionSummary.dart';

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

    final numberOfQuestions = questions.length;
    final numberOfCorrectAnswers = getSummaryData().where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

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
                Text("You Answered $numberOfCorrectAnswers / $numberOfQuestions Questions Correctly!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 201, 153, 251),
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 30),

               Questionsummary(getSummaryData()),

                const SizedBox(height: 30),

                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => questionsScreen()),
                      (route) => false,
                    );
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