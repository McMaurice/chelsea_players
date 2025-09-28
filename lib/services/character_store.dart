import 'package:chelsea_players/models/character.dart';
import 'package:chelsea_players/services/firestore_services.dart';
import 'package:flutter/material.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  // Getter
  get characters => _characters;

  // add new character
  void addCharacter(Character character) {
    FirestoreServices.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  // save/update character
  Future<void> saveCharacter(Character character) async {
    await FirestoreServices.updateCharacter(character);
    return;
  }

  // remove characcter
  Future<void> removeCharacter(Character character) async {
    await FirestoreServices.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }

  // initially fetch characters
  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreServices.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}
