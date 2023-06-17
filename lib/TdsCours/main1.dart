// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:myapp/TdsCours/pokemon.dart';
import 'pages.dart';
import 'amazingRow.dart';
import 'ecran.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      initialRoute: PageName.home,
      routes: {
        PageName.home: (context) => const Home(),
        PageName.detail: (context) => const DetailScreen(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final pokedex = <Pokemon>[
    Pokemon(texte: 'Artikodin', icon: Icons.ac_unit),
    Pokemon(texte: 'Sulfura', icon: Icons.sunny),
    Pokemon(texte: 'Electhor', icon: Icons.thunderstorm),
    Pokemon(texte: 'Mewtwo', icon: Icons.remove_red_eye),
    Pokemon(texte: 'Mewtwo', icon: Icons.remove_red_eye),
    Pokemon(texte: 'Mewtwo', icon: Icons.remove_red_eye),
    Pokemon(texte: 'Mewtwo', icon: Icons.remove_red_eye),
    Pokemon(texte: 'Mewtwo', icon: Icons.remove_red_eye),
    Pokemon(texte: 'Mewtwo', icon: Icons.remove_red_eye),
    Pokemon(texte: 'Mewtwo', icon: Icons.remove_red_eye),
  ];
  late final TextEditingController _mycontroller;
  String textFieldValue = '';
  @override
  void initState() {
    _mycontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _mycontroller.dispose();
    super.dispose();
  }

  void removePokemon(int index) {
    setState(() {
      pokedex.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premiere Appli')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _mycontroller,
                    onChanged: (value) {
                      setState(() {
                        textFieldValue = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Entrez du texte',
                      labelText: 'Champ de texte',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final String nameToAdd =
                        _mycontroller.text.trim().toUpperCase();
                    if (nameToAdd == '') {
                      return;
                    } else if (nameToAdd.length < 3) {
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'La longueur du nom doit être supérieure ou égale à 3.'),
                          ),
                        );
                      }
                      return;
                    } else if (pokedex
                        .any((pokemon) => pokemon.texte == nameToAdd)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ce nom existe déjà dans la liste.'),
                        ),
                      );

                      return;
                    }

                    setState(() {
                      pokedex.insert(
                          0,
                          Pokemon(
                            texte: nameToAdd,
                            icon: Icons.question_mark,
                          ));
                    });
                    Navigator.pushNamed(context, PageName.detail);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Valeur du champ de texte : $textFieldValue'),
            const SizedBox(height: 16),
            for (int i = 0; i < pokedex.length; i++)
              TheAmazingRow(
                icon: pokedex[i].icon,
                label: pokedex[i].texte.toUpperCase(),
                onDelete: () => removePokemon(i),
              ),
          ],
        ),
      ),
    );
  }
}
