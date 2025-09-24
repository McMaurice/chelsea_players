import 'package:chelsea_players/models/vocation.dart';

class Skill {
  // Properties
  final String id;
  final String name;
  final String image;
  final Vocation vocation;

  // Constructor
  Skill({
    required this.id,
    required this.name,
    required this.image,
    required this.vocation,
  });
}
 
// Dummy skills data
final List<Skill> allSkills = [
  // algo wizard skills
  Skill(id: '1', name: 'Wizard skill 1', image: 'bf_bolt.jpg', vocation: Vocation.wizard),
  Skill(id: '2', name: 'Wizard skill 2', image: 'r_wave.jpg', vocation: Vocation.wizard),
  Skill(id: '3', name: 'Wizard skill 3', image: 'h_beam.jpg', vocation: Vocation.wizard),
  Skill(id: '4', name: 'Wizard skill 4', image: 'backtrack.jpg', vocation: Vocation.wizard),

  // terminal raider skills
  Skill(id: '5', name: 'Raider skill 1', image: 'l_touch.jpg', vocation: Vocation.raider),
  Skill(id: '6', name: 'Raider skill 2', image: 's_blast.jpg', vocation: Vocation.raider),
  Skill(id: '7', name: 'Raider skill 3', image: 'f_clear.jpg', vocation: Vocation.raider),
  Skill(id: '8', name: 'Raider skill 4', image: 's_shell.jpg', vocation: Vocation.raider),

   // code junkie skills
  Skill(id: '9', name: 'Junkie skill 1', image: 'i_loop.jpg', vocation: Vocation.junkie),
  Skill(id: '10', name: 'Junkie skill 2', image: 't_cast.jpg', vocation: Vocation.junkie),
  Skill(id: '11', name: 'Junkie skill 3', image: 'encapsulate.jpg', vocation: Vocation.junkie),
  Skill(id: '12', name: 'Junkie skill 4', image: 'c_paste.jpg', vocation: Vocation.junkie),

  // ux ninja skills
  Skill(id: '13', name: 'Ninja skill 1', image: 'gamify.jpg', vocation: Vocation.ninja),
  Skill(id: '14', name: 'Ninja skill 2', image: 'h_map.jpg', vocation: Vocation.ninja),
  Skill(id: '15', name: 'Ninja skill 3', image: 'wireframe.jpg', vocation: Vocation.ninja),
  Skill(id: '16', name: 'Ninja skill 4', image: 'd_pattern.jpg', vocation: Vocation.ninja),
];
