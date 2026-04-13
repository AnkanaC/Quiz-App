class QuizQuestions {
  final String question;
  final List<String> options;
  //final String answer;

  const QuizQuestions({
    required this.question,
    required this.options,
  });

  List<String> getShuffledOptions() {
    final shuffledOptions = List.of(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }
}