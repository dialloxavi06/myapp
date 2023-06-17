// ignore_for_file: library_private_types_in_public_api

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
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  String? userAnswer;
  bool isCorrect = false;

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
      if (userAnswer == null) {
        showMessage('Veuillez choisir une réponse.', false);
        return;
      }

      final selectedAnswer = currentQuestion.options.indexOf(userAnswer!);

      setState(() {
        isCorrect = selectedAnswer == 0;
      });

      if (isCorrect) {
        showMessage('Bonne réponse !', true);
        moveToNextQuestion();
      } else {
        showMessage('Réponse incorrecte. Réessayez.', false);
      }
    }
  }

  void moveToNextQuestion() {
    if (hasNextQuestion) {
      setState(() {
        currentQuestionIndex++;
        userAnswer = null;
        isCorrect = false;
      });
    } else {
      // All questions answered, return to initial screen
      Navigator.popUntil(context, ModalRoute.withName('/'));
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
              tileColor: option == userAnswer && isCorrect
                  ? Colors.green
                  : option == userAnswer && !isCorrect
                      ? Colors.red
                      : null,
              onTap: () {
                setState(() {
                  userAnswer = option;
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
              onPressed: userAnswer != null ? checkAnswer : null,
              child: Text(hasNextQuestion ? 'Suivant' : 'Terminé'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Retour á l\'écran  Initial'),
            ),
          ],
        ),
      ),
    );
  }
}
