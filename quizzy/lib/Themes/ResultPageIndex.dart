import 'package:flutter/material.dart';

class ResultScreenindex extends StatelessWidget {
  const ResultScreenindex({super.key, required this.index, required this.indColor});

  final String index;
  final Color indColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: indColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            index,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}