import 'warriors.dart';

abstract class Location {
  late Type preferedType;
}

class Cave extends Location {
  Cave() {
    preferedType = Dwarf;
  }
}

class Field extends Location {
  Field() {
    preferedType = Archer;
  }
}

class Town extends Location {
  Town() {
    preferedType = Knight;
  }
}
