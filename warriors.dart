import 'dart:math';

class Warrior {
  Random _rng = new Random();
  late int _hp;
  late int _minDamage;
  late int _maxDamage;
  late String _name;
  String get name => _name;
  bool _isAlive = true;
  bool get isAlive => _isAlive;
  bool hit(Warrior enemy) {
    int randomDamage = _rng.nextInt(_maxDamage - _minDamage);
    enemy._hp -= _minDamage + randomDamage;
    print(
        "${_name} hits - ${_minDamage + randomDamage} : enemy hp = ${enemy._hp}");
    if (enemy._hp <= 0) {
      enemy.die();
      return true;
    }
    return false;
  }

  void increaseDamage() {
    _minDamage += (_minDamage * 0.3).toInt();
    _maxDamage += (_maxDamage * 0.3).toInt();
  }

  void die() {
    _isAlive = false;
  }
}

class Knight extends Warrior {
  Knight([String name = "Knight"]) {
    _hp = 100;
    _minDamage = 20;
    _maxDamage = 30;
    _name = name;
  }
}

class Archer extends Warrior {
  Archer([String name = "Archer"]) {
    _hp = 80;
    _minDamage = 30;
    _maxDamage = 40;
    _name = name;
  }
}

class Dwarf extends Warrior {
  Dwarf([String name = "Dwarf"]) {
    _hp = 130;
    _minDamage = 10;
    _maxDamage = 30;
    _name = name;
  }
}
