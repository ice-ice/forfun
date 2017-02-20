part of mud;

class Vampire extends Encounter with RandomDamage {
  Vampire() : super._()  {
    this.damage_value = damage_value;
  }
  whenEncounter() {
    return "A vampire is flying by!";
  }
}
