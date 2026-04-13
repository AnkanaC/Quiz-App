import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/Screens/Results_Screen.dart';
import 'package:quizzy/Themes/backgroundColors.dart';
import 'package:quizzy/data/Questions.dart';
import 'package:quizzy/models/Answer_Button.dart';

class questionsScreen extends StatefulWidget {
  const questionsScreen({super.key});

  @override
  State<questionsScreen> createState() => _questionsScreenState();
}

class _questionsScreenState extends State<questionsScreen> {
  List<String> selectedAnswrs = [];

  void chooseAnswer(String answer) {
    selectedAnswrs.add(answer);

    if(selectedAnswrs.length == questions.length) {
      // All questions have been answered, navigate to the results screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            chosenAnswers: selectedAnswrs,
          ),
        ),
      );
    }
  }

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer)
  {
      chooseAnswer(selectedAnswer);
      setState(() {
        if(currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
      }
      });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body : BackgroundColours.blue(
        child: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuestion.question,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 201, 153, 251),
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
          
              const SizedBox(height: 20),
          
              ...currentQuestion.getShuffledOptions().map((option) {
                  return AnswerButton(
                    answerText : option, 
                    onTap : (){
                      answerQuestion(option);
                    }
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}