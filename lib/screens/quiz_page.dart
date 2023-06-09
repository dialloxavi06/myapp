import 'package:flutter/material.dart';
import '../widgets/quiz_question_widget.dart';

class QuizPage extends StatefulWidget {
  final String quizTitle;
  final String quizDescription;
  final List<Question> questions;

  const QuizPage({
    Key? key,
    required this.quizTitle,
    required this.quizDescription,
    required this.questions,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  String? userAnswer;
  bool isCorrect = true;

  bool get hasNextQuestion =>
      currentQuestionIndex < widget.questions.length - 1;

  void checkAnswer() {
    final currentQuestion = widget.questions[currentQuestionIndex];

    if (currentQuestion.type == QuestionType.textField) {
      if (userAnswer == null || userAnswer!.trim().isEmpty) {
        showMessage('Veuillez entrer une réponse.', false);
        return;
      }

      final answer = userAnswer!.toLowerCase().trim();
      final correctAnswer = currentQuestion.correctAnswer.toLowerCase().trim();
      if (answer == correctAnswer) {
        isCorrect = true;
        showMessage('Bonne réponse !', true);
        moveToNextQuestion();
      } else {
        isCorrect = false;
        showMessage('Réponse incorrecte. Réessayez.', false);
      }
    } else if (currentQuestion.type == QuestionType.options) {
      final selectedAnswer = currentQuestion.options.indexOf(userAnswer!);

      setState(() {
        isCorrect = selectedAnswer == -1 ? false : selectedAnswer == 0;
      });

      if (isCorrect) {
        showMessage('Bonne réponse !', true);

        // moveToNextQuestion();
      } else {
        showMessage('Réponse incorrecte. Réessayez.', false);
      }
    }
  }

  void moveToNextQuestion() {
    setState(() {
      if (isCorrect && currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
      }
      userAnswer = null;
      isCorrect = false;
    });
  }

  void navigateToNextQuestion() {
    if (hasNextQuestion) {
      moveToNextQuestion();
    } else {
      showMessage('Terminé.', true);
    }
  }

  void showMessage(String message, bool isCorrectAnswer) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isCorrectAnswer ? Colors.green : Colors.red,
      ),
    );
  }

  Widget buildQuestion() {
    final currentQuestion = widget.questions[currentQuestionIndex];

    if (currentQuestion.type == QuestionType.textField) {
      return TextField(
        decoration: const InputDecoration(
          hintText: 'Entrer votre réponse',
        ),
        onChanged: (value) {
          setState(() {
            userAnswer = value;
          });
        },
      );
    } else if (currentQuestion.type == QuestionType.options) {
      return Column(
        children: [
          for (final option in currentQuestion.options)
            ListTile(
              title: Text(option),
              tileColor: option == userAnswer
                  ? isCorrect
                      ? Colors.green
                      : Colors.red
                  : null,
              onTap: () {
                setState(() {
                  userAnswer = option;
                  if (option == currentQuestion.correctAnswer) {
                    isCorrect = true;
                  } else {
                    isCorrect = false;
                  }
                });
              },
            ),
        ],
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= widget.questions.length) {
      return Container();
    }
    final currentQuestion = widget.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            buildQuestion(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: userAnswer != null ? navigateToNextQuestion : null,
              child: Text(hasNextQuestion ? 'Suivant' : 'Terminer'),
            ),
          ],
        ),
      ),
    );
  }
}
