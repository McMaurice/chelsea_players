import 'package:chelsea_players/models/skill.dart';
import 'package:chelsea_players/models/stats.dart';
import 'package:chelsea_players/models/vocation.dart';

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
}

// Dummy players data
List<Character> character = [
  Character(name: "OZED", slogan: "KaPoff", vocation: Vocation.wizard, id: "1"),
  Character(name: "Kenzy", slogan: "Light em up..", vocation: Vocation.junkie, id: "2"),
  Character(name: "CeeJay", slogan: "Godspeed", vocation: Vocation.raider, id: "3"),
  Character(name: "Snake Eyes", slogan: "Catch me if you can", vocation: Vocation.ninja, id: "4"),
];
