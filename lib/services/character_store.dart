import 'package:game_characters/models/character.dart';
import 'package:game_characters/services/firestore_services.dart';
import 'package:flutter/material.dart';

// Set up a Provider class extending to ChangeNotifier (step 2)
class CharacterStore extends ChangeNotifier {
  // In the same class, link the provider to your Model in a _private store
  final List<Character> _characters = [];

  // Setup a getter to access the private store
  get characters => _characters;

  // create all functions that affects the data and call NotifyListeners in it to trigger a rer-run
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
