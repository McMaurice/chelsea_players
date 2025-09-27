import 'package:chelsea_players/models/character.dart';
import 'package:chelsea_players/models/vocation.dart';
import 'package:chelsea_players/services/firestore_services.dart';
import 'package:flutter/material.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(
      name: "OZED",
      slogan: "KaPoff",
      vocation: Vocation.wizard,
      id: "1",
    ),
    Character(
      name: "Kenzy",
      slogan: "Light em up..",
      vocation: Vocation.junkie,
      id: "2",
    ),
    Character(
      name: "CeeJay",
      slogan: "Godspeed",
      vocation: Vocation.raider,
      id: "3",
    ),
    Character(
      name: "Snake Eyes",
      slogan: "Catch me if you can",
      vocation: Vocation.ninja,
      id: "4",
    ),
  ];

  // Getter
  get characters => _characters;

  // add new character
  void addCharacter(Character character) {
    FirestoreServices.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  // save/update character

  // remove characcter

  // initially fetch characters
}
