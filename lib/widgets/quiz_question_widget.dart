enum QuestionType {
  textField,
  options,
}

class Question {
  final String questionText;
  final QuestionType type;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.type,
    required this.options,
    required this.correctAnswer,
  });
}
