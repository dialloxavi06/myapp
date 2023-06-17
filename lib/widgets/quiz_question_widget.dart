enum QuestionType {
  textField,
  options,
}

class Question {
  final QuestionType type;
  final String questionText;
  final String correctAnswer;
  final List<String> options;

  Question({
    required this.type,
    required this.questionText,
    required this.correctAnswer,
    this.options = const [],
  });
}
