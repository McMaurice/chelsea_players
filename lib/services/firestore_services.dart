import 'package:game_characters/models/character.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static final ref = FirebaseFirestore.instance
      .collection('character')
      .withConverter(
        fromFirestore: Character.fromFirestore,
        toFirestore: (Character c, _) => c.toFirestore(),
      );

  // add character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  // get characters once
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  // update character
  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      'skills': character.skills.map((s) => s.id).toList(),
      'isFav': character.isFav,
    });
  }

  // Delete character
  static Future<void> deleteCharacter(Character character) async {
    await ref.doc(character.id).delete();
  }
}
