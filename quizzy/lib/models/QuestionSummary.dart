import 'package:flutter/material.dart';
import 'package:quizzy/Themes/ResultPageIndex.dart';

class Questionsummary extends StatelessWidget {
  const Questionsummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  ResultScreenindex(
                    index: ((data['question_index'] as int) + 1).toString(),
                    indColor: (data['user_answer'] as String) == (data['correct_answer'] as String)
                        ? const Color.fromARGB(255, 147, 255, 150)
                        : const Color.fromARGB(255, 255, 137, 128),
                  ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String),
                        const SizedBox(height: 5),
                        Text(data['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 185, 250),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(data['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 147, 154, 255),
                          ),
                        ),
                      ],
                    ),
                ),  
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}