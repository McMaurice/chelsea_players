import 'package:chelsea_players/models/skill.dart';
import 'package:chelsea_players/models/stats.dart';
import 'package:chelsea_players/models/vocation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Character with Stats {
  // Constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // Properties
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // Getters
  bool get isFav => _isFav;

  // Methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  //TODO: Try add multiple skills

  // Converts Character to Map
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  // Factory function to map from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    //get data from the snapshot
    final data = snapshot.data()!;

    // make character instance
    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      id: snapshot.id,
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
      ),
    );

    // update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }

    //set isFav
    if (data['isFave'] == true) {
      character.toggleIsFav();
    }

    // assign stats & points
    character.setStats(point: data['points'], stats: data['stats']);
    
    return character;
  }
}

// Dummy players data

