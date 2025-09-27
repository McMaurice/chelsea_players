import 'package:chelsea_players/models/character.dart';
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
  

}
