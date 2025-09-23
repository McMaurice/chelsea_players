mixin Stats {
  int _points = 10;
  int _speed = 10;
  int _strength = 10;
  int _passing = 10;
  int _shooting = 10;
  int _stamina = 10;

  // Getters
  int get points => _points;

  Map<String, int> get statsAsMap => {
        'speed': _speed,
        'strength': _strength,
        'passing': _passing,
        'shooting': _shooting,
        'stamina': _stamina,
      };

  List<Map<String, String>> get statsAsListFormattedList => [
    {'title': 'Speed', 'value': _speed.toString()},
    {'title': 'Strength', 'value': _strength.toString()},
    {'title': 'Passing', 'value': _passing.toString()},
    {'title': 'Shooting', 'value': _shooting.toString()},
    {'title': 'Stamina', 'value': _stamina.toString()},
  ];

  // Methods
  void increaseStat(String stat) {
    if (_points > 0) {
      if (stat == 'speed') {
        _speed++;
      } else if (stat == 'strength') {
        _strength++;
      } else if (stat == 'passing') {
        _passing++;
      } else if (stat == 'shooting') {
        _shooting++;
      } else if (stat == 'stamina') {
        _stamina++;
      }
    }
  }

  void decreaseStat(String stat) {
    if (stat == 'speed' && _speed > 5) {
      _speed--;
      _points++;
    } else if (stat == 'strength' && _strength > 5) {
      _strength--;
      _points++;
    } else if (stat == 'passing' && _passing > 5) {
      _passing--;
      _points++;
    } else if (stat == 'shooting' && _shooting > 5) {
      _shooting--;
      _points++;
    } else if (stat == 'stamina' && _stamina > 0) {
      _stamina--;
      _points++;
    }
  }
}
