import 'dart:math';

import 'locations.dart';
import 'warriors.dart';
import 'dart:io';

class Game {
  late Location _location;
  late List<Warrior> _warriors;

  void chooseLocation() {
    bool isReady = true;
    do {
      print(
          "Choose your location:\n1 - Cave (Dwarf bonus)\n2 - Town (Knight bonus)\n3 - Field (Archer bonus)");
      String? input = stdin.readLineSync();
      switch (input) {
        case "1":
          _location = Cave();
          isReady = true;
          break;
        case "2":
          _location = Town();
          isReady = true;
          break;
        case "3":
          _location = Field();
          isReady = true;
          break;
        default:
          isReady = false;
          print(input);
      }
    } while (!isReady);
    _increaseDamage();
  }

  void chooseWarrior() {
    bool isReady = true;
    Warrior? playersWarrior;
    do {
      print("Choose your warrior:\n1 - Dwarf\n2 - Knight\n3 - Archer");
      String? input = stdin.readLineSync();
      switch (input) {
        case "1":
          playersWarrior = Dwarf("Your ${Dwarf}");
          isReady = true;
          break;
        case "2":
          playersWarrior = Knight("Your ${Knight}");
          isReady = true;
          break;
        case "3":
          playersWarrior = Archer("Your ${Archer}");
          isReady = true;
          break;
        default:
          isReady = false;
          print(input);
      }
    } while (!isReady);
    _warriors = [];
    _warriors.add(playersWarrior!);
    List<Warrior> enemyWarriors = [
      Dwarf("Enemy ${Dwarf}"),
      Archer("Enemy ${Archer}"),
      Knight("Enemy ${Knight}")
    ];
    Random random = Random();
    _warriors.add(enemyWarriors[random.nextInt(3)]);
    _warriors.shuffle();
  }

  void _increaseDamage() {
    for (Warrior warrior in _warriors) {
      if (warrior.runtimeType == _location.preferedType)
        warrior.increaseDamage();
    }
  }

  void play() {
    while (_warriors[0].isAlive && _warriors[1].isAlive) {
      if (_warriors[0].hit(_warriors[1])) break;
      _warriors[1].hit(_warriors[0]);
    }
    print((_warriors[0].isAlive ? _warriors[0].name : _warriors[1].name) +
        " wins!");
  }
}
