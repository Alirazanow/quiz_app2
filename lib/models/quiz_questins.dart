class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> get shuffuledAnswer {
    final shuffuledList = List.of(answer);
    shuffuledList.shuffle();
    return shuffuledList;
  }
}
