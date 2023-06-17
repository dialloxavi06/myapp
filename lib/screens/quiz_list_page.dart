import 'package:flutter/material.dart';
import '../widgets/quiz_question_widget.dart';
import 'quiz_page.dart';

class QuizListPage extends StatelessWidget {
  const QuizListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Questions'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Type 1'),
            subtitle: const Text('Projet des Questions'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(
                    quizTitle: 'Question á reponse',
                    quizDescription: 'Quelle est la capitale de la france',
                    questions: [
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Quelle est la capitale de la france',
                        correctAnswer: 'paris',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Quelle est la capitale de la guinée',
                        correctAnswer: 'Conakry',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Quelle est la capitale de l\'allemagne',
                        correctAnswer: 'berlin',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText:
                            'Quel est le nom du président de la france',
                        correctAnswer: 'Macron',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText:
                            'Quel est le nom du président de la guinée',
                        correctAnswer: 'alpha condé',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Type 2'),
            subtitle: const Text('Question á choix multiple'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(
                    quizTitle: 'QCM',
                    quizDescription: 'Choisir la Bonne Réponse',
                    questions: [
                      Question(
                        type: QuestionType.options,
                        questionText: 'Quelle est la formule de l\'eau',
                        correctAnswer: 'H2O',
                        options: ['H2O', 'CO2', 'CH3'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText:
                            'Quelle est la planete la plus proche de la terre',
                        correctAnswer: 'Mars',
                        options: ['Mars', 'pluton', 'venus'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText: 'Quel est la capitale de la belgique',
                        correctAnswer: 'bruxelle',
                        options: ['bern', 'paris', 'bruxelle'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText:
                            'Quelle instruction on utilise pour faire de l\'affichage en console en javascript',
                        correctAnswer: 'console.log',
                        options: ['echo', 'print', 'console.log'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText:
                            'Qel est le nom de l\'ex chanceliére de l\'allemagne',
                        correctAnswer: 'angela merkel',
                        options: [
                          'angela merkel',
                          'elisabeth born',
                          'ursula von der leyen'
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Add more quizzes here
        ],
      ),
    );
  }
}
