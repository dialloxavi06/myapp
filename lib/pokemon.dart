// la class de nos pokemon
import 'package:flutter/cupertino.dart';

class Pokemon {
  final String texte;
  final IconData icon;

  Pokemon({required this.texte, required this.icon});

  String get upperCaseText => texte.toUpperCase();
}
