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
            title: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Type 1'),
              ),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Répondre en un seul mot'),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(
                    quizTitle: 'Question á reponse',
                    quizDescription: 'Quelle est la capitale de la France',
                    questions: [
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Quelle est la capitale de la France',
                        correctAnswer: 'Paris',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Quelle est la capitale de la Guinée',
                        correctAnswer: 'Conakry',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Quelle est la capitale de l\'Allemagne',
                        correctAnswer: 'Berlin',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText:
                            'Quel est le nom du président de la France',
                        correctAnswer: 'Macron',
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText:
                            'Quel est le nom du président de la Guinée',
                        correctAnswer: 'Alpha Condé',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Type 2'),
              ),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Question á choix multiple'),
              ),
            ),
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
                            'Quelle est la planète la plus proche de la Terre',
                        correctAnswer: 'Mars',
                        options: ['Mars', 'Pluton', 'Venus'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText: 'Quel est la capitale de la Belgique',
                        correctAnswer: 'Bruxelles',
                        options: ['Bern', 'Paris', 'Bruxelles'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText:
                            'Quelle instruction utilise-t-on pour faire de l\'affichage en console en JavaScript',
                        correctAnswer: 'console.log',
                        options: ['echo', 'print', 'console.log'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText:
                            'Quel est le nom de l\'ex-chancelière de l\'Allemagne',
                        correctAnswer: 'Angela Merkel',
                        options: [
                          'Angela Merkel',
                          'Elisabeth Born',
                          'Ursula von der Leyen'
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
