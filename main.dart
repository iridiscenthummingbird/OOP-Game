import 'dart:io';
import 'locations.dart';
import 'warriors.dart';

void main() {
  Location location = Field();
  Knight knight = Knight();
  Archer archer = Archer();
  Dwarf dwarf = Dwarf();
  List<Warrior> warriors = [dwarf, archer];
  for (Warrior warrior in warriors) {
    if (warrior.runtimeType == location.preferedType) warrior.increaseDamage();
  }
  warriors.shuffle();
  while (warriors[0].isAlive && warriors[1].isAlive) {
    if (warriors[0].hit(warriors[1])) break;
    warriors[1].hit(warriors[0]);
  }
}
