import 'package:flutter/material.dart';
import '../screens/quiz_page.dart';
import '../widgets/quiz_question_widget.dart';

class QuizListPage extends StatelessWidget {
  const QuizListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz List'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Questions à Répondre'),
            subtitle: const Text(
                'Testez vos connaissances en répondant aux différentes questions'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(
                    quizTitle: 'Questions-Réponses',
                    quizDescription:
                        'Répondez correctement sans faire de commentaire.',
                    questions: [
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Quelle est la capitale de la France ?',
                        correctAnswer: 'Paris',
                        options: [],
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText: 'Qui a peint "La Joconde" ?',
                        correctAnswer: 'Leonardo da Vinci',
                        options: [],
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText:
                            'Quelle est la planète la plus proche du soleil ?',
                        correctAnswer: 'Mercure',
                        options: [],
                      ),
                      Question(
                        type: QuestionType.textField,
                        questionText:
                            'Quelle est la formule chimique de l\'eau ?',
                        correctAnswer: 'H2O',
                        options: [],
                      ),
                      // Ajoutez d'autres questions ici
                    ],
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Questions à choix Multiple'),
            subtitle: const Text(
                'Testez vos connaissances en choisissant la bonne réponse'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(
                    quizTitle: 'QCM',
                    quizDescription: 'Choisissez une seule réponse',
                    questions: [
                      Question(
                        type: QuestionType.options,
                        questionText:
                            'Quelle est la formule chimique de l\'eau ?',
                        correctAnswer: 'H2O',
                        options: ['CH3', 'H2O', 'C2H6'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText: 'Quelle est la capitale de la Guinée ?',
                        correctAnswer: 'Conakry',
                        options: ['Dakar', 'Accra', 'Conakry'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText: 'Quel joueur a remporté 7 Ballon d\'Or ?',
                        correctAnswer: 'Messi',
                        options: ['Messi', 'Ronaldo', 'Benzema'],
                      ),
                      Question(
                        type: QuestionType.options,
                        questionText:
                            'Quel est le nom de l\'ancien Président de la Guinée ?',
                        correctAnswer: 'Alpha Condé',
                        options: ['Wade', 'Alpha Condé', 'Macron'],
                      ),
                      // Ajoutez d'autres questions ici
                    ],
                  ),
                ),
              );
            },
          ),
          // Ajoutez d'autres quiz ici
        ],
      ),
    );
  }
}
