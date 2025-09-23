import 'package:chelsea_players/models/stats.dart';

class Player with Stats{
  // Constructor
  Player({
    required this.name,
    required this.position,
    required this.number,
    required this.id,
  });

  // Properties
  final String name;
  final String position;
  final int number;
  final String id;
  bool _isFav = false;

  // Getters
  bool get isFav => _isFav;

  // Methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

}
