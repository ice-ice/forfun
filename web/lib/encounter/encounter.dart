part of mud;

abstract class Encounter {
  int damage_value = 0;

  Encounter._();

  factory Encounter(Map options) {
    options ??= new Map();

    var _rng = new Random();
    var value = _rng.nextInt(4);

    switch (value) {
      case 1:
        return new Bear();
      case 2:
        return new Angel();
      case 3:
        return new Vampire();
      default:
        return new Nothing();
    }
  }
  whenEncounter();
}
