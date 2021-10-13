import 'game.dart';

void main() {
  Game game = Game()
    ..chooseWarrior()
    ..chooseLocation()
    ..play();
}
