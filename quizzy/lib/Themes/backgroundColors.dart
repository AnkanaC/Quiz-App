import 'package:flutter/material.dart';
import 'package:quizzy/Screens/QuestionsPage.dart';
import 'package:quizzy/Screens/homepage.dart';

class BackgroundColours extends StatefulWidget {
  const BackgroundColours({
    this.colour1,
    this.colour2,
    required this.child,
    super.key,
  });

  final Color? colour1;
  final Color? colour2;
  final Widget child;

  const BackgroundColours.blue({
    required this.child,
    super.key,
  })  : colour1 = const Color.fromARGB(255, 45, 0, 168),
        colour2 = const Color.fromARGB(255, 22, 0, 103);

  @override
  State<BackgroundColours> createState() => _BackgroundColoursState();
}

class _BackgroundColoursState extends State<BackgroundColours> {
  var activeScreen = 'Home-Page';

  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            widget.colour1!,
            widget.colour2!,
          ],
        ),
      ),

      child: widget.child,
    );
  }
}