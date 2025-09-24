mixin Stats {
  // Properties
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  // Getters
  int get points => _points;

  Map<String, int> get statsAsMap => {
    'speed': _health,
    'strength': _attack,
    'passing': _defense,
    'shooting': _skill,
  };

  // Returns stats as a list of maps with title and value
  List<Map<String, String>> get statsAsFormattedList => [
    {'title': 'Speed', 'value': _health.toString()},
    {'title': 'Strength', 'value': _attack.toString()},
    {'title': 'Passing', 'value': _defense.toString()},
    {'title': 'Shooting', 'value': _skill.toString()},
  ];

  // Methods
  void increaseStat(String stat) {
    if (_points > 0) {
      if (stat == 'health') {
        _health++;
      }
      if (stat == 'attack') {
        _attack++;
      }
      if (stat == 'defense') {
        _defense++;
      }
      if (stat == 'skill') {
        _skill++;
      }
    }
  }

  void decreaseStat(String stat) {
    if (stat == 'health' && _health > 5) {
      _health--;
      _points++;
    }
    if (stat == 'attack' && _attack > 5) {
      _attack--;
      _points++;
    }
    if (stat == 'defense' && _defense > 5) {
      _defense--;
      _points++;
    }
    if (stat == 'skill' && _skill > 5) {
      _skill--;
      _points++;
    }
  }
}
